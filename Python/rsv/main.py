from azure.identity import InteractiveBrowserCredential
from azure.mgmt.recoveryservices import RecoveryServicesClient, models
from azure.mgmt.recoveryservicesbackup import RecoveryServicesBackupClient
import azure.mgmt.recoveryservicesbackup.activestamp.models as backup_models

# from concurrent import futures
import pyexcel_ods as ods
from collections import OrderedDict
import logging
from azure.mgmt.resource import SubscriptionClient

# from functools import partial
import requests
from urllib import parse

AZURE_BACKUP_MANAGEMENT_TYPES = {
    "AzureIaasVM": "Azure Virtual Machine",
    "AzureWorkload": "SAP HANA in Azure VM",
    "MAB": "Azure Backup Agent",
    "AzureBackupServer": "Azure Backup Server",
    "DPM": "Data Protection Manager",
    "AzureStorage": "Azure Storage",
    "AzureSql": "Azure SQL Database",
}

RECOVERY_SERVICE_VAULT_HEADERS = [
    "Recovery Service Vault Name",
    "Type",
    "Immutability",
    "Resource group",
    "Location",
    "Subscription ID",
    "Storage Replication Type",
]

# No direct mapping or direct 'tierType' in Azure SDK for Python found, however based on observation between these properties and azure cli's return response, these are the values.
RECOVERY_SERVICE_VAULT_TYPE_TIER_MAP = {
    "instantrp": "Snapshot",
    "hardenedrp": "Vault",
    "archivedrp": "Vault-Archive",
}

BACKUP_ITEM_HEADERS = [
    "Backup Management Type",
    "Backup Item Name",
    "Recovery Services Vault Name",
    "Backup Health Status",  # "Pre Check Status"
    "Last Backup Status",
    "Backup Policy",
    "Subscription",
    "Subscription ID",
]

RECOVERY_POINT_HEADERS = [
    "Backup Item Name",
    "Recovery Point ID",
    "Creation Time",
    "Consistency",
    "Recovery Type",
    "Raw Recovery Types (type:status;)",
    "Expiry Time",
]

SHEET1_HEADERS = [
    *RECOVERY_SERVICE_VAULT_HEADERS,
]

SHEET2_HEADERS = [
    *BACKUP_ITEM_HEADERS,
]

SHEET3_HEADERS = [
    *RECOVERY_POINT_HEADERS,
]

NA = "Not Available"
MAX_THREADS = 10
VERSION = "v0.3"
logger = logging.getLogger(__name__)
logging.basicConfig(
    filename="main_{}.log".format(VERSION), encoding="utf-8", level=logging.INFO
)


def handler():
    logger.info("Starting handler {}".format(VERSION))

    # Auth
    logger.info("Authorizing")
    credential = InteractiveBrowserCredential()
    logger.info("Authorization Done")

    try:
        logger.info("Starting processing")
        subscriptions = get_subscriptions(credential)

        logger.info("Processing {} subscriptions".format(len(subscriptions)))
        """with futures.ThreadPoolExecutor(max_workers=MAX_THREADS) as executor:
            ps_with_cred = partial(process_subscription, credential)
            executor.map(ps_with_cred, subscriptions)"""
        for subscription in subscriptions:
            process_subscription(credential, subscription)

        logger.info("Finished Processing handler successfully")
    except Exception as e:
        logger.error("An error occurred: {}".format(e))
        logger.info("Failed Processing")


def process_subscription(credential: InteractiveBrowserCredential, subscription):
    logger.info("In process_subscription")
    subscription_id = str(subscription.id).split("/")[2]
    logger.info("Processing Subcription: {}".format(subscription_id))
    logger.info("Authorizing Client for {}".format(subscription_id))
    rs_client = RecoveryServicesClient(
        credential=credential, subscription_id=subscription_id
    )
    b_client = RecoveryServicesBackupClient(
        credential=credential, subscription_id=subscription_id
    )
    logger.info("Client authorized and connections open for {}".format(subscription_id))
    logger.info("Getting vaults for {}".format(subscription_id))
    vaults = list(rs_client.vaults.list_by_subscription_id())
    logger.info("Retrieved {} vaults for {}".format(len(vaults), subscription_id))
    for vault in vaults:
        process_vault(vault, b_client, credential)
    logger.info("Vaults processed for {}".format(subscription_id))
    logger.info("Processed Subcription: {}".format(subscription_id))
    logger.info("Closing connections for Subcription: {}".format(subscription_id))
    rs_client.close()
    b_client.close()
    logger.info("Closed connections for Subcription: {}".format(subscription_id))


def get_subscriptions(credential: InteractiveBrowserCredential):
    logger.info("Getting Subscriptions")
    subscription_client = SubscriptionClient(credential)
    subscriptions = list(subscription_client.subscriptions.list())
    logger.info("Subscriptions retrieved")

    return subscriptions


def process_vault(
    vault: models.Vault,
    b_client: RecoveryServicesBackupClient,
    credential: InteractiveBrowserCredential,
):
    logger.info("Processing vault {}".format(vault.id))
    data = OrderedDict()
    sheet1 = list()
    sheet2 = list()
    sheet3 = list()

    sheet1.append(SHEET1_HEADERS)  # Append a 'list' item, not its items
    sheet2.append(SHEET2_HEADERS)
    sheet3.append(SHEET3_HEADERS)

    vault_name = str(vault.name)
    vault_type = vault.type
    vault_resource_group = str(vault.id).split("/")[4]
    vault_location = vault.location
    vault_subid = str(vault.id).split("/")[2]

    vault_storage_replication_type = NA
    vault_immutability = NA
    if getattr(vault, "properties", None) is not None:
        if (
            getattr(vault.properties, "security_settings", None) is not None
            and getattr(vault.properties.security_settings, "immutability_settings")
            is not None
            and getattr(
                vault.properties.security_settings.immutability_settings, "state", None
            )
            is not None
        ):
            vault_immutability = (
                vault.properties.security_settings.immutability_settings.state
            )
        if (
            getattr(vault.properties, "redundancy_settings", None) is not None
            and getattr(
                vault.properties.redundancy_settings,
                "standard_tier_storage_redundancy",
                None,
            )
            is not None
        ):
            logger.info(
                "Retrieved redundancy settings using default method successfully for {}".format(
                    vault_subid
                )
            )
            vault_storage_replication_type = (
                vault.properties.redundancy_settings.standard_tier_storage_redundancy
            )
        else:
            logger.info(
                "Failed to get redundancy settings for {}, switching to alternate method".format(
                    vault_subid
                )
            )
            vault_storage_replication_type = get_alternate_storage_replication_type(
                vault_resource_group, vault_subid, vault_name, credential
            )

    logger.info("Storing Recovery Vault for {}".format(vault_subid))
    sheet1.append(
        [
            str(vault_name),
            str(vault_type),
            str(vault_immutability),
            str(vault_resource_group),
            str(vault_location),
            str(vault_subid),
            str(vault_storage_replication_type),
        ]
    )
    logger.info("Storage complete for {}".format(vault_subid))

    logger.info("Getting backup items for {}".format(vault_subid))
    backup_items = list(
        b_client.backup_protected_items.list(vault.name, vault_resource_group)
    )
    logger.info("Got {} backup items".format(len(backup_items)))

    for backup_item in backup_items:
        logger.info(
            "Processing backup item {} with id {}".format(
                backup_item.name, backup_item.id
            )
        )

        backup_item_name = backup_item.name
        backup_management_type = backup_item.properties.backup_management_type
        if backup_item.type in AZURE_BACKUP_MANAGEMENT_TYPES:
            backup_management_type = AZURE_BACKUP_MANAGEMENT_TYPES.get(backup_item.type)
        backup_item_health_status = NA
        backup_item_last_backup_status = NA
        # https://learn.microsoft.com/en-us/python/api/azure-mgmt-recoveryservicesbackup/azure.mgmt.recoveryservicesbackup.activestamp.models.protecteditem?view=azure-python, ProtectedItemResource.properties can be one of the given subclasses in it, and its properties depend on that subclass.
        if isinstance(backup_item.properties, backup_models.AzureIaaSVMProtectedItem):
            backup_item_health_status = backup_item.properties.health_status  # https://learn.microsoft.com/en-us/python/api/azure-mgmt-recoveryservicesbackup/azure.mgmt.recoveryservicesbackup.activestamp.models.azureiaasvmprotecteditem?view=azure-python
            backup_item_last_backup_status = (
                str(backup_item.properties.last_backup_status)
                + " "
                + str(backup_item.properties.last_backup_time)
            )

        if (
            isinstance(
                backup_item.properties, backup_models.AzureFileshareProtectedItem
            )
            or isinstance(
                backup_item.properties, backup_models.MabFileFolderProtectedItem
            )
            or isinstance(
                backup_item.properties, backup_models.AzureVmWorkloadProtectedItem
            )
        ):
            backup_item_last_backup_status = (
                str(backup_item.properties.last_backup_status)
                + " "
                + str(backup_item.properties.last_backup_time)
            )

        if isinstance(
            backup_item.properties, backup_models.AzureVmWorkloadProtectedItem
        ):
            backup_item_health_status = (
                backup_item.properties.protected_item_health_status
            )

        backup_item_backup_policy = backup_item.properties.policy_name

        backup_item_id_parts = str(backup_item.id).split("/")
        backup_item_resource_group = backup_item_id_parts[4]
        backup_item_fabric = backup_item_id_parts[10]
        backup_item_container = backup_item_id_parts[12]
        backup_item_protected_item_name = backup_item_id_parts[14]
        backup_item_subscription = backup_item_id_parts[2]
        backup_item_subscription_id = vault_subid

        logger.info(
            "Storing Backup Item for Backup Item {} with management type {}".format(
                backup_item.id, backup_management_type
            )
        )
        sheet2.append(
            [
                str(backup_management_type),
                str(backup_item_name),
                str(vault_name),
                str(backup_item_health_status),
                str(backup_item_last_backup_status),
                str(backup_item_backup_policy),
                str(backup_item_subscription),
                str(backup_item_subscription_id),
            ]
        )
        logger.info(
            "Storage complete for Backup Item {} with management type {}".format(
                backup_item.id, backup_management_type
            )
        )

        logger.info(
            "Getting recovery points for {} with \n vault_name={} \nresource_group_name={} \n fabric_name={} \n container_name={} \n protected_item_name={}".format(
                backup_item.id,
                vault_name,
                backup_item_resource_group,
                backup_item_fabric,
                backup_item_container,
                backup_item_protected_item_name,
            )
        )
        recovery_points = list(
            b_client.recovery_points.list(
                vault_name=vault_name,
                resource_group_name=backup_item_resource_group,
                fabric_name=backup_item_fabric,
                container_name=backup_item_container,
                protected_item_name=backup_item_protected_item_name,
            )
        )

        logger.info(
            "Got {} Recovery points for {}".format(len(recovery_points), backup_item.id)
        )

        for rp in recovery_points:
            logger.info("Processing recovery point {}".format(rp.id))

            # https://learn.microsoft.com/en-us/python/api/azure-mgmt-recoveryservicesbackup/azure.mgmt.recoveryservicesbackup.activestamp.models.recoverypoint?view=azure-python
            rp_id = rp.id
            rp_creation_time = NA
            rp_consistency = NA
            rp_recovery_type = NA
            rp_expiry_time = NA
            rp_raw_recovery_types = NA

            # rp.properties can be of type AzureFileShareRecoveryPoint, IaasVMRecoveryPoint, GenericRecoveryPoint or AzureWorkloadRecoveryPoint
            if getattr(rp.properties, "recovery_point_time", None) is not None:
                rp_creation_time = rp.properties.recovery_point_time  # As is for backup_models.AzureFileShareRecoveryPoint, IaasVMRecoveryPoint, GenericRecoveryPoint
            elif getattr(rp.properties, "recovery_point_time_in_utc", None) is not None:
                rp_creation_time = (
                    rp.properties.recovery_point_time_in_utc
                )  # As is for AzureWorkloadRecoveryPoint

            if getattr(rp.properties, "recovery_point_type", None) is not None:
                rp_consistency = (
                    rp.properties.recovery_point_type
                )  # As is for AzureFileShareRecoveryPoint

            if (
                getattr(rp.properties, "recovery_point_properties", None) is not None
                and getattr(
                    rp.properties.recovery_point_properties, "expiry_time", None
                )
                is not None
            ):
                rp_expiry_time = rp.properties.recovery_point_properties.expiry_time  # As is for AzureFileShareRecoveryPoint, AzureWorkloadRecoveryPoint, GenericRecoveryPoint, IaasVMRecoveryPoint

            # Like https://learn.microsoft.com/en-us/python/api/azure-mgmt-recoveryservicesbackup/azure.mgmt.recoveryservicesbackup.activestamp.models.azureworkloadrecoverypoint?view=azure-python
            if (
                getattr(
                    rp.properties,
                    "recovery_point_tier_details",
                    None,
                )
                is not None
            ):
                for tier in rp.properties.recovery_point_tier_details:
                    tierType = str(tier.type).lower
                    tierStatus = str(tier.status).lower
                    if tierType in RECOVERY_SERVICE_VAULT_TYPE_TIER_MAP and (
                        tierStatus == "valid" or tierStatus == "rehydrated"
                    ):
                        if rp_recovery_type == NA:
                            rp_recovery_type = ""
                        else:
                            rp_recovery_type += "and"
                        rp_recovery_type += RECOVERY_SERVICE_VAULT_TYPE_TIER_MAP.get(
                            tierType
                        )

                    if rp_raw_recovery_types == NA:
                        rp_raw_recovery_types = ""
                    else:
                        rp_raw_recovery_types += ";"
                    rp_raw_recovery_types += str(tier.type) + ":" + str(tier.status)

                if rp_recovery_type != NA:
                    rp_recovery_type += "Standard"

            logger.info(
                "Storing Recovery point {} for backup item {}".format(
                    rp_id, backup_item.id
                )
            )
            sheet3.append(
                [
                    str(backup_item_name),
                    str(rp_id),
                    str(rp_creation_time),
                    str(rp_consistency),
                    str(rp_recovery_type),
                    str(rp_raw_recovery_types),
                    str(rp_expiry_time),
                ]
            )
            logger.info(
                "Storage complete for Recovery point {} of backup item {}".format(
                    rp_id, backup_item.id
                )
            )
            logger.info(
                "Finished processing  Recovery point {} of backup item {}".format(
                    rp_id, backup_item.id
                )
            )
        logger.info("Finished processing backup item {}".format(backup_item.name))
    logger.info("Finished processing backup items for {}".format(vault_subid))

    data.update({"Sheet 1": sheet1})
    if len(sheet2) > 1:
        data.update({"Sheet 2": sheet2})
        if len(sheet3) > 1:
            data.update(
                {"Sheet 3": sheet3}
            )  # If there's no backup item, there'll be no recovery point anyway

    write_to_file(str(vault.name) + "_" + str(vault_subid), data)

    logger.info("Finished processing vault {}".format(vault_name))


def get_alternate_storage_replication_type(
    vault_resource_group: str,
    vault_subid: str,
    vault_name: str,
    credential: InteractiveBrowserCredential,
) -> str:
    logger.info("In get_alternate_storage_replication_type for {}".format(vault_name))
    storage_replication_type = NA
    token = credential.get_token("https://management.azure.com/.default").token
    url = "https://management.azure.com/subscriptions/{}/resourceGroups/{}/providers/Microsoft.RecoveryServices/vaults/{}?api-version=2024-04-01".format(
        vault_subid, vault_resource_group, vault_name
    )
    headers = {
        "Authorization": "Bearer {}".format(token),
        "Content-Type": "application/json",
    }
    response = requests.get(url, headers=headers)
    try:
        if response.status_code == 200:
            vault_data = response.json()
            result = str(
                vault_data.get("properties", {})
                .get("redundancySettings", {})
                .get("standardTierStorageRedundancy")
            )
            if result is not None and result != "":
                logger.info(
                    "Successfully retrieved standard tier storage redundancy for {}".format(
                        vault_name
                    )
                )
                storage_replication_type = result
        else:
            print(f"Error: {response.status_code}, {response.text}")
    except Exception as e:
        logger.error("Exception in get_alternate_storage_replication_type {}".format(e))
    if storage_replication_type != NA:
        logger.info("Found {} for {}".format(storage_replication_type, vault_name))
    else:
        logger.info("Failed to find storage replication type for {}".format(vault_name))
    return storage_replication_type


def write_to_file(filename: str, data: dict):
    logger.info("Writing to {}.ods".format(filename))
    save_location = str(filename) + ".ods"
    logger.info("Saving to {}".format(save_location))
    ods.save_data(save_location, data)
    logger.info("Successfully wrote to {}".format(save_location))


if __name__ == "__main__":
    logger.info("Program starting")
    handler()

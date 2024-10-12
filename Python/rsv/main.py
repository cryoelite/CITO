from azure.identity import InteractiveBrowserCredential
from azure.mgmt.recoveryservices import RecoveryServicesClient, models
from azure.mgmt.recoveryservicesbackup import RecoveryServicesBackupClient
import azure.mgmt.recoveryservicesbackup.activestamp.models as backup_models
import pyexcel_ods as ods
from collections import OrderedDict
import logging
from azure.mgmt.resource import SubscriptionClient

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
    "Recovery Point Name",
    "Creation Time",
    "Consistency",
    "Recovery Type",
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

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)


def handler():
    logger.info("Starting handler")

    # Auth
    logger.info("Authorizing")
    credential = InteractiveBrowserCredential()
    logger.info("Authorization Done, connections opened")

    try:
        logger.info("Starting processing")
        subscriptions = get_subscriptions(credential)

        logger.info("Processing {} subscriptions".format(len(subscriptions)))
        for subscription in subscriptions:
            subscription_id = str(subscription.id).split("/")[2]
            logger.info("Processing Subcription: {}".format(subscription_id))

            logger.info("Authorizing Client for {}".format(subscription_id))
            rs_client = RecoveryServicesClient(
                credential=credential, subscription_id=subscription_id
            )
            b_client = RecoveryServicesBackupClient(
                credential=credential, subscription_id=subscription_id
            )
            logger.info("Client authorized for {}".format(subscription_id))

            logger.info("Getting vaults")

            vaults = list(rs_client.vaults.list_by_subscription_id())
            logger.info("Vaults retrieved {} vaults".format(len(vaults)))
            for vault in vaults:
                process_vault(vault, b_client)

            logger.info("Vaults processed for {}".format(subscription_id))

            logger.info("Processed Subcription: {}".format(subscription_id))
            logger.info(
                "Closing connections for Subcription: {}".format(subscription_id)
            )

            rs_client.close()
            b_client.close()

            logger.info(
                "Closed connections for Subcription: {}".format(subscription_id)
            )

        logger.info("Finished Processing handler successfully")
    except Exception as e:
        logger.error("An error occurred: {}".format(e))
        logger.info("Failed Processing")


def get_subscriptions(credential: InteractiveBrowserCredential):
    logger.info("Getting Subscriptions")
    subscription_client = SubscriptionClient(credential)
    subscriptions = list(subscription_client.subscriptions.list())
    logger.info("Subscriptions retrieved")

    return subscriptions


def process_vault(vault: models.Vault, b_client: RecoveryServicesBackupClient):
    logger.info("Processing vault {}".format(vault.name))
    data = OrderedDict()
    sheet1 = list()
    sheet2 = list()
    sheet3 = list()

    sheet1.append(SHEET1_HEADERS)  # Append a 'list' item, not its items
    sheet2.append(SHEET2_HEADERS)
    sheet3.append(SHEET3_HEADERS)

    vault_name = vault.name
    vault_type = vault.type
    vault_resource_group = str(vault.id).split("/")[4]
    vault_location = vault.location
    vault_subid = str(vault.id).split("/")[2]

    vault_storage_replication_type = (
        vault.properties.redundancy_settings.standard_tier_storage_redundancy
    )
    vault_immutability = "Not Available"
    if (
        vault.properties
        and vault.properties.security_settings
        and vault.properties.security_settings.immutability_settings
    ):
        vault_immutability = (
            vault.properties.security_settings.immutability_settings.state
        )

    logger.info("Storing Recovery Vault for {}".format(vault.name))
    sheet1.append(
        [
            vault_name,
            vault_type,
            vault_immutability,
            vault_resource_group,
            vault_location,
            vault_subid,
            vault_storage_replication_type,
        ]
    )
    logger.info("Storage complete for {}".format(vault.name))

    logger.info("Getting backup items")
    backup_items = list(
        b_client.backup_protected_items.list(vault.name, vault_resource_group)
    )
    logger.info("Got {} backup items".format(len(backup_items)))

    for backup_item in backup_items:
        logger.info("Processing backup item {}".format(backup_item.name))

        backup_item_name = backup_item.name
        backup_management_type = backup_item.properties.backup_management_type
        if backup_item.type in AZURE_BACKUP_MANAGEMENT_TYPES:
            backup_management_type = AZURE_BACKUP_MANAGEMENT_TYPES.get(backup_item.type)
        backup_item_health_status = "Not Available"
        backup_item_last_backup_status = "Not Available"
        # https://learn.microsoft.com/en-us/python/api/azure-mgmt-recoveryservicesbackup/azure.mgmt.recoveryservicesbackup.activestamp.models.protecteditem?view=azure-python, ProtectedItemResource.properties can be one of the given subclasses in it, and its properties depend on that subclass.
        if issubclass(backup_item.properties, backup_models.AzureIaaSVMProtectedItem):
            backup_item_health_status = backup_item.properties.health_status  # https://learn.microsoft.com/en-us/python/api/azure-mgmt-recoveryservicesbackup/azure.mgmt.recoveryservicesbackup.activestamp.models.azureiaasvmprotecteditem?view=azure-python
            backup_item_last_backup_status = (
                backup_item.properties.last_backup_status
                + " "
                + backup_item.properties.last_backup_time
            )

        if (
            issubclass(
                backup_item.properties, backup_models.AzureFileshareProtectedItem
            )
            or issubclass(
                backup_item.properties, backup_models.MabFileFolderProtectedItem
            )
            or issubclass(
                backup_item.properties, backup_models.AzureVmWorkloadProtectedItem
            )
        ):
            backup_item_last_backup_status = (
                backup_item.properties.last_backup_status
                + " "
                + backup_item.properties.last_backup_time
            )

        if issubclass(
            backup_item.properties, backup_models.AzureVmWorkloadProtectedItem
        ):
            backup_item_health_status = (
                backup_item.properties.protected_item_health_status
            )

        backup_item_backup_policy = backup_item.properties.policy_name
        backup_item_subscription = backup_item.id.split("/")[2]
        backup_item_subscription_id = vault_subid

        logger.info(
            "Storing Backup Item for Backup Item {} with management type {}".format(
                backup_item_name, backup_management_type
            )
        )
        sheet2.append(
            [
                backup_management_type,
                backup_item_name,
                vault_name,
                backup_item_health_status,
                backup_item_last_backup_status,
                backup_item_backup_policy,
                backup_item_subscription,
                backup_item_subscription_id,
            ]
        )
        logger.info(
            "Storage complete for Backup Item {} with management type {}".format(
                backup_item_name, backup_management_type
            )
        )

        container_name = backup_item.id.split("/")[8]
        protected_item_name = backup_item.id.split("/")[-1]

        logger.info("Getting recovery points")
        recovery_points = list(
            b_client.recovery_points.list(
                vault_name,
                vault_resource_group,
                fabric_name="Azure",
                container_name=container_name,
                protected_item_name=protected_item_name,
            )
        )

        logger.info(
            "Got {} Recovery points for {}".format(
                len(recovery_points), backup_item.name
            )
        )

        for rp in recovery_points:
            logger.info("Processing recovery point {}".format(rp.name))

            # https://learn.microsoft.com/en-us/python/api/azure-mgmt-recoveryservicesbackup/azure.mgmt.recoveryservicesbackup.activestamp.models.recoverypoint?view=azure-python
            rp_name = rp.name
            rp_creation_time = "Not Available"
            rp_consistency = "Not Available"
            rp_recovery_type = "Not Available"
            rp_expiry_time = "Not Available"
            if (
                isinstance(rp.properties, backup_models.AzureFileShareRecoveryPoint)
                or isinstance(rp.properties, backup_models.GenericRecoveryPoint)
                or isinstance(rp.properties, backup_models.IaasVMRecoveryPoint)
            ):
                rp_creation_time = rp.properties.recovery_point_time
                rp_recovery_type = rp.properties.recovery_point_type
                rp_expiry_time = rp.properties.recovery_point_properties.expiry_time
                rp_consistency = rp.properties.recovery_point_properties.rule_name

            if isinstance(rp.properties, backup_models.AzureWorkloadRecoveryPoint):
                rp_creation_time = rp.properties.recovery_point_time_in_utc
                rp_recovery_type = rp.properties.type
            logger.info(
                "Storing Recovery point {} for backup item {}".format(
                    rp_name, backup_item_name
                )
            )
            sheet3.append(
                [
                    backup_item_name,
                    rp_name,
                    rp_creation_time,
                    rp_consistency,
                    rp_recovery_type,
                    rp_expiry_time,
                ]
            )
            logger.info(
                "Storage complete for Recovery point {} of backup item {}".format(
                    rp_name, backup_item_name
                )
            )
            logger.info("Finished processing recovery point")
        logger.info("Finished processing backup item {}".format(backup_item.name))
    logger.info("Finished processing backup items")

    data.update({"Sheet 1": sheet1})
    if len(sheet2) > 1:
        data.update({"Sheet 2": sheet2})
        if len(sheet3) > 1:
            data.update(
                {"Sheet 3": sheet3}
            )  # If there's no backup item, there'll be no recovery point anyway

    write_to_file(vault.name, data)

    logger.info("Finished processing vault {}".format(vault_name))


def write_to_file(filename: str, data: dict):
    logger.info("Writing to {}".format(filename))
    ods.save_data(filename, data)
    logger.info("Successfully wrote {}".format(filename))


if __name__ == "__main__":
    logger.info("Program starting")
    handler()

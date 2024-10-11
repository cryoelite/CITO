from azure.identity import DefaultAzureCredential
from azure.mgmt.recoveryservices import RecoveryServicesClient, models
from azure.mgmt.recoveryservicesbackup import RecoveryServicesBackupClient
import pyexcel_ods as ods
from collections import OrderedDict
import logging

SUBSCRIPTION_ID = ""

""" AZURE_WORKLOAD_TYPES = {
    "AzureIaasVM": "Azure Virtual Machine",
    "SAPHanaDatabase": "SAP HANA in Azure VM",
    "MAB": "Azure Backup Agent",
    "AzureBackupServer": "Azure Backup Server",
    "DPM": "Data Protection Manager",
    "AzureStorage": "Azure Storage",
    "AzureSQL": "Azure SQL Database",
} """

AZURE_WORKLOAD_TYPES = {
    "Microsoft.Compute/virtualMachines": "Azure Virtual Machine",
    "AzureWorkloadProtectedItem": "SAP HANA in Azure VM",
    "MABProtectedItem": "Azure Backup Agent/Server",
    "DPMProtectedItem": "Data Protection Manager",
    "AzureFileShareProtectedItem": "Azure Storage",
    "Microsoft.Sql/servers/databases": "Azure SQL Database",
}

RECOVERY_VAULT_HEADERS = [
    "Recovery Service Name",
    "Type",
    "Immutability",
    "Resource group",
    "Location",
    "Subscription",
]

BACKUP_ITEM_HEADERS = [
    "Backup Item Name",
    "Protected Item Type",
    "Pre Check Status",
    "Last Backup Status",
    "Backup Policy",
    "Subscription ID",
]

RECOVERY_POINT_HEADERS = [
    "Creation Time",
    "Consistency",
    "Recovery Type",
    "Expiry Time",
]

SHEET1_HEADERS = [
    *RECOVERY_VAULT_HEADERS,
    "Workload Type",
    "Backup Item Name",
]

SHEET2_HEADERS = [
    *BACKUP_ITEM_HEADERS,
    *RECOVERY_POINT_HEADERS,
]


logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.DEBUG)


def handler():
    logger.info("Starting handler")

    # Auth
    logger.debug("Authorizing")
    credential = DefaultAzureCredential()
    rs_client = RecoveryServicesClient(
        credential=credential, subscription_id=SUBSCRIPTION_ID
    )
    b_client = RecoveryServicesBackupClient(
        credential=credential, subscription_id=SUBSCRIPTION_ID
    )
    logger.debug("Authorization Done, connections opened")

    try:
        logger.info("Starting processing")
        process_vaults(rs_client, b_client)

        logger.debug("Closing connections")
        rs_client.close()
        b_client.close()
        logger.debug("Connections Closed")
        logger.info("Finished Processing successfully")
    except Exception as e:
        logger.error("An error occurred: {}".format(e))
        logger.info("Failed Processing")


def process_vaults(
    rs_client: RecoveryServicesClient, b_client: RecoveryServicesBackupClient
):
    logger.info("Starting processing of recovery service vaults")
    logger.debug("Getting vaults")
    vaults = list(rs_client.vaults.list_by_subscription_id())
    logger.debug("Vaults retrieved {} vaults".format(len(vaults)))
    for vault in vaults:
        process_vault(vault, b_client)
    logger.info("Vaults processed")


def process_vault(vault: models.Vault, b_client: RecoveryServicesBackupClient):
    logger.info("Processing {}".format(vault.name))
    data = OrderedDict()
    sheet1 = list()
    sheet2 = list()

    sheet1.append(SHEET1_HEADERS)  # Append a 'list' item, not its items
    sheet2.append(SHEET2_HEADERS)

    vault_name = vault.name
    vault_type = vault.type
    vault_resource_group = vault.id.split("/")[4]
    vault_location = vault.location
    vault_subid = SUBSCRIPTION_ID
    vault_immutability = "Not Available"
    if vault.properties and hasattr(vault.properties, "immutability"):
        vault_immutability = (
            vault.properties.immutability.state
            if vault.properties.immutability
            else "Disabled"
        )
    logger.debug("Getting backup items")
    backup_items = list(
        b_client.backup_protected_items.list(vault.name, vault_resource_group)
    )
    logger.debug("Got {} backup items".format(len(backup_items)))

    for backup_item in backup_items:
        logger.debug("Processing backup item {}".format(backup_item.name))

        backup_item_name = backup_item.name
        backup_item_protected_item_type = backup_item.type
        if backup_item.type in AZURE_WORKLOAD_TYPES:
            backup_item_protected_item_type = AZURE_WORKLOAD_TYPES.get(backup_item.type)
        backup_item_pre_check_status = (
            backup_item.properties.pre_backup_validation_status
        )
        backup_item_last_backup_status = backup_item.properties.last_backup_status
        backup_item_backup_policy = backup_item.properties.policy_name
        backup_item_subscription_id = backup_item.id.split("/")[2]

        sheet1.append(
            [
                vault_name,
                vault_type,
                vault_immutability,
                vault_resource_group,
                vault_location,
                vault_subid,
                backup_item_protected_item_type,
                backup_item_name,
            ]
        )
        logger.debug("Processing Recovery points")
        container_name = backup_item.id.split("/")[8]
        protected_item_name = backup_item.id.split("/")[-1]

        logger.debug("Getting recovery points")
        recovery_points = list(
            b_client.recovery_points.list(
                vault_name,
                vault_resource_group,
                fabric_name="Azure",
                container_name=container_name,
                protected_item_name=protected_item_name,
            )
        )

        logger.debug(
            "Got {} Recovery points for {}".format(
                len(recovery_points), backup_item.name
            )
        )

        for rp in recovery_points:
            logger.debug("Processing recovery point")
            rp_creation_time = rp.properties.recovery_point_time
            rp_consistency = rp.properties.recovery_point_tier_type
            rp_recovery_type = rp.properties.recovery_type
            rp_expiry_time = rp.properties.expiry_time

            sheet2.append(
                [
                    backup_item_name,
                    backup_item_protected_item_type,
                    backup_item_pre_check_status,
                    backup_item_last_backup_status,
                    backup_item_backup_policy,
                    backup_item_subscription_id,
                    rp_creation_time,
                    rp_consistency,
                    rp_recovery_type,
                    rp_expiry_time,
                ]
            )
            logger.debug("Finished processing recovery point")
        logger.debug("Finished processing backup item {}".format(backup_item.name))
    logger.debug("Finished processing backup items")
    
    data.update({"Sheet 1": sheet1})
    data.update({"Sheet 2": sheet2})

    write_to_file(vault.name, data)
    
    logger.info("Finished processing vault {}".format(vault_name))


def write_to_file(filename: str, data: dict):
    logger.info("Writing to {}".format(filename))
    ods.save_data(filename, data)
    logger.info("Successfully wrote {}".format(filename))


if __name__ == "__main__":
    logger.debug("Program starting")
    handler()

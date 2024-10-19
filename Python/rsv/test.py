x = "/subscriptions/7fdac9e3-d9b9-4025-9ea4-86a0963ae134/resourceGroups/rsg-brso-n-backup-01/providers/Microsoft.RecoveryServices/vaults/rsvlrs-brso-n-backup-01/backupFabrics/Azure/protectionContainers/IaasVMContainer;iaasvmcontainerv2;RSG-BRSO-N-CAS-01;ZWBRSONACAS001/protectedItems/VM;iaasvmcontainerv2;RSG-BRSO-N-CAS-01;ZWBRSONACAS001"
backup_item_id_parts=str(x).split('/')
backup_item_resource_group=backup_item_id_parts[4]
backup_item_fabric=backup_item_id_parts[10]
backup_item_container=x.find("protectionContainers")[12]
backup_item_protected_item_name=backup_item_id_parts[14]
print(backup_item_resource_group)
print(backup_item_fabric)
print(backup_item_container)
print(backup_item_protected_item_name)
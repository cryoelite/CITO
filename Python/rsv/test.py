x = "/subscriptions/7fdac9e3-d9b9-4025-9ea4-86a0963ae134/resourceGroups/rsg-brso-n-backup-01/providers/Microsoft.RecoveryServices/vaults/rsvlrs-brso-n-backup-01/backupFabrics/Azure/protectionContainers/IaasVMContainer;iaasvmcontainerv2;RSG-BRSO-N-CAS-01;ZWBRSONACAS001/protectedItems/VM;iaasvmcontainerv2;RSG-BRSO-N-CAS-01;ZWBRSONACAS001"
backup_item_resource_group=str(x).split('/')[4]
backup_item_fabric=str(x).split('/')[10]
backup_item_container=str(x).split('/')[12]
backup_item_protected_item_name=str(x).split('/')[14]
print(backup_item_resource_group)
print(backup_item_fabric)
print(backup_item_container)
print(backup_item_protected_item_name)
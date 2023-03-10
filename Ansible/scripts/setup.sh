#!/bin/sh
echo "Starting to store env vars in the vault"
echo "The BKP_LOC is $BKP_LOC"

ansible-vault encrypt_string $ROOT_PS --name 'password' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml
echo "" >> /root/development/group_vars/vars.yml

ansible-vault encrypt_string $BKP_LOC --name 'BKP_LOC' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml
echo "" >> /root/development/group_vars/vars.yml

echo "remote_pass = $ROOT_PS" >> /etc/ansible/ansible.cfg
echo "" >> /etc/ansible/ansible.cfg

echo "Ansible Vault Created"

cat /root/development/group_vars/vars.yml
echo "Catted"


ansible-playbook -i /root/development/custom_inventory.ini ~/development/setup.ansible.yml  --vault-password-file /root/development/.vault-pass

echo "Playbook 1 finished"

#ansible-playbook -i /root/development/custom_inventory.ini ~/development/config.ansible.yml --vault-password-file /root/development/.vault-pass


echo "All Playbooks finished"

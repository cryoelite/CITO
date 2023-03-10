# escape=`
FROM docker:23.0.1

FROM ubuntu:22.10
LABEL "Author"="cryonim"

FROM python:3.11.1

RUN apt-get update
RUN apt-get upgrade -y

RUN pip install docker
RUN pip install ansible
RUN pip install argcomplete
RUN apt-get install -y nano
RUN pip install -Iv 'resolvelib<0.6.0'
RUN ansible-galaxy collection install community.docker:3.4.2
RUN ansible-galaxy collection install community.general
RUN apt-get install -y sshpass

RUN apt-get update
RUN apt-get upgrade -y

RUN mkdir ~/development
RUN mkdir -p ~/development/group_vars/
RUN touch ~/development/group_vars/vars.yml

RUN mkdir -p /etc/ansible/
#Relative to parent folder of dockerfile in context, we do so because docker can only see files & folders within its context's directory, not above it.
COPY ["docker/.vault-pass", "/root/development/"]
COPY ["docker/ansible.cfg", "/etc/ansible/"]
COPY ["playbooks/setup.ansible.yml", "/root/development/"]
COPY ["playbooks/config.ansible.yml", "/root/development/"]
COPY ["scripts/setup.sh", "/root/development/"]
RUN chmod 644 ~/development/.vault-pass
RUN chmod 777 /etc/ansible//ansible.cfg
RUN chmod 644 ~/development/setup.ansible.yml
RUN chmod 644 ~/development/config.ansible.yml
RUN chmod 777 ~/development/setup.sh

RUN touch ~/development/custom_inventory.ini
RUN chmod 777 ~/development/custom_inventory.ini


ENTRYPOINT ["/root/development/setup.sh"]
# escape=`
FROM ubuntu:22.10 AS ubuntu
LABEL "Author"="cryonim"

RUN apt-get update
RUN apt-get upgrade -y

#Install Docker, sharing engine with the host
RUN apt-get install -y ca-certificates
RUN apt-get install -y curl
RUN apt-get install -y gnupg
RUN apt-get install -y lsb-release
RUN mkdir -m 0755 -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN chmod a+r /etc/apt/keyrings/docker.gpg
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
RUN apt-get update
RUN apt-get upgrade -y

#Set up python in ubuntu (Not using python base image)
RUN apt-get install -y python3=3.10.6-1
RUN apt-get install -y python3-pip
RUN apt-get update
RUN apt-get upgrade -y


#Set up Ansible
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir docker
RUN pip install --no-cache-dir ansible
RUN pip install --no-cache-dir argcomplete

RUN pip install --no-cache-dir -Iv 'resolvelib<0.6.0'
RUN ansible-galaxy collection install community.docker:3.4.2
RUN ansible-galaxy collection install community.general

RUN apt-get update
RUN apt-get upgrade -y

#Set up misc packages
RUN apt-get install -y nano
RUN apt-get install -y sshpass

RUN apt-get update
RUN apt-get upgrade -y

#Set up local directories
RUN mkdir ~/development
RUN mkdir -p ~/development/group_vars/
RUN touch ~/development/group_vars/vars.yml

RUN mkdir -p /etc/ansible/
COPY ["docker/.vault-pass", "/root/development/"]
COPY ["docker/ansible.cfg", "/etc/ansible/"]

COPY ["scripts/setup.sh", "/root/development/"]
RUN chmod 644 ~/development/.vault-pass
RUN chmod 777 /etc/ansible//ansible.cfg
RUN chmod 777 ~/development/setup.sh

RUN touch ~/development/custom_inventory.ini
RUN chmod 777 ~/development/custom_inventory.ini


ENTRYPOINT ["/root/development/setup.sh"]

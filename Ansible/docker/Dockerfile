# escape=`
#Set up Ansible
FROM python:3.11.1 AS python
LABEL "Author"="cryonim"

#Based on https://stackoverflow.com/a/50339110/13036358

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir docker
RUN pip install --no-cache-dir ansible
RUN pip install --no-cache-dir argcomplete

RUN pip install --no-cache-dir -Iv 'resolvelib<0.6.0'
RUN ansible-galaxy collection install community.docker:3.4.2
RUN ansible-galaxy collection install community.general

FROM ubuntu:22.10 AS ubuntu
#Bad Practise, but is given in the SO comment above.
COPY --from=python /usr/local/lib/python3.11 /usr/local/lib/python3.11
COPY --from=python /usr/local/bin /usr/local/bin

ENV LD_LIBRARY_PATH="/usr/local/lib/python3.11/lib-dynload:/usr/local/lib/python3.11:${LD_LIBRARY_PATH}"
ENV PATH="/usr/local/bin:${PATH}"

RUN ansible-vault

RUN apt-get update
RUN apt-get upgrade -y

#Install Docker, not sharing engine with the host right now, for sharing either use dind or https://stackoverflow.com/a/44807990/13036358
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
#Relative to parent folder of dockerfile in context, we do so because docker can only see files & folders within its context's directory, not above it.
COPY ["docker/.vault-pass", "/root/development/"]
COPY ["docker/ansible.cfg", "/etc/ansible/"]
#COPY ["playbooks/setup.ansible.yml", "/root/development/playbooks/"]
#COPY ["playbooks/config.ansible.yml", "/root/development/playbooks/"]
COPY ["scripts/setup.sh", "/root/development/"]
RUN chmod 644 ~/development/.vault-pass
RUN chmod 777 /etc/ansible//ansible.cfg
#RUN chmod 644 ~/development/playbooks/setup.ansible.yml
#RUN chmod 644 ~/development/playbooks/config.ansible.yml
RUN chmod 777 ~/development/setup.sh

RUN touch ~/development/custom_inventory.ini
RUN chmod 777 ~/development/custom_inventory.ini

#CMD ["sleep", "infinity"] //just keeps the container and its services alive, https://stackoverflow.com/a/42873832/13036358, this is due to how docker works, https://stackoverflow.com/a/30632659/13036358

ENTRYPOINT ["/root/development/setup.sh"]
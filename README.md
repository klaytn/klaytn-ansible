
# Ansible : klaytn_ansible collection

## Description

Kakao’s global public blockchain project Klaytn is an enterprise-grade, service-centric platform that brings user-friendly blockchain experience to millions. It combines the best features of both public blockchains (decentralized data & control, distributed governance) and private blockchains (low latency, high scalability) via an efficient 'hybrid' design. Klaytn is secured by participation from numerous highly-reputable brands around the globe, working together to create a reliable business platform atop a robust system of decentralized trust. Klaytn enables businesses and entrepreneurs today to capture value using blockchain technology. Klaytn is the future, designed by Ground X. [https://www.klaytn.com/](https://www.klaytn.com/)

Klaytn provides advanced tooling that allows you to quickly build, operate & govern and grow blockchain networks. [https://docs.klaytn.com/](https://docs.klaytn.com/)

<br>

### Installation
```
ansible-galaxy collection install klaytndev.klaytn_ansible
```

### Role list
No           |   role name   |  description
------------ | ------------- | -------------
 1           |    [klaytn_node](https://github.com/klaytn/klaytn-ansible/tree/master/roles/klaytn_node)     |   install / configuration Klaytn packages
 2           |    [klaytn_bridge](https://github.com/klaytn/klaytn-ansible/tree/master/roles/klaytn_bridge)     |   configure bridge between two chains
 3           |    [klaytn_grafana](https://github.com/klaytn/klaytn-ansible/tree/master/roles/klaytn_grafana)     |   install / configure grafana

## Launch Ansible
### Preparation
First, update inventory.

```
[ServiceChainCN]
SCN1 ansible_user=MY_USER ansible_host=1.2.3.4 ansible_ssh_private_key_file=/home/myuser/.ssh/mykey.pem

[controller]
builder ansible_host=localhost ansible_connecion=local ansible_user=YOUR_USER
```
Also, update Klaytn version to the latest one.
Refer to [Klaytn Download page](https://docs.klaytn.com/node/download)
for the latest version of Klaytn.

```
klaytn_homi:
    version: v1.7.3
```

### Using docker
You can use provided docker image for Klaytn ansible. The docker image is inside of `docker` directory.

* **STEP 1:**  Copy your private SSH key for the ansible image.

&nbsp;&nbsp;&nbsp;`cp /YOUR/KEY/PATH docker/keys/ansible.key`

* **STEP 2:** Lauch docker image using `docker-compose` command.

&nbsp;&nbsp;&nbsp;&nbsp;`docker-compose up -d `

<br>

**Docker includes the following packages**

Package Name               | Package Version
-------------------------- | -------------
net-tools                  | latest
software-properties-common | latest
ansible                    | latest
python-pip                 | latest
python-dev                 | latest
build-essential            | latest
groff                      | latest
boto3                      | latest
awscli                     | latest

<br>


### Using your local ansible plugins

You are also able to use your own `Ansible`, `Ansible AWX` or `Ansible Towner`

For example,
```
$ cp roles/klaytn_node/tutorial/service_chain_SCN_setup.yml .
$ ansible-playbook -i roles/klaytn_node/inventory service_chain_SCN_setup.yml
```

Or you can use the provided script.
```
$ ./test_roles.sh node
$ ./test_roles.sh bridge
$ ./test_roles.sh grafana
```

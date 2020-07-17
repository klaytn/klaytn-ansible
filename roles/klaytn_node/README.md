Ansible Role : klaytn_node
=========

This Ansible Role enables you to automate to install/configure Klaytn CN(core node), PN(proxy node) and EN(endpoint node) for both Baobab(test-net) or Cypress(main-net). 

And this role enables you to build Service-Chain(a private netowrk) and connect to Main-Chain of Klaytn easily. We also provide Terraform moddule to provision the infrastructure in AWS and Azure. Here is the link of [Klaytn Terraform Repo](https://github.com/klaytn/klaytn-terraform) 

<br>

## Functionalities

&nbsp;**For Main-Chain** (Baobab : test-net, Cypress : main-net) :

1. **Install/update Klaytn packages (KCN, KPN, KEN)** 
- https://docs.klaytn.com/node/endpoint-node/installation-guide/installation-guide
- https://docs.klaytn.com/node/download

2. **Configure Klaytn services**  
- https://docs.klaytn.com/node/core-cell/operation-guide/configuration
- https://docs.klaytn.com/node/endpoint-node/operation-guide/configuration

3. **Download the chaindata snapshot backed up daily by Klaytn team**
- https://docs.klaytn.com/node/endpoint-node/installation-guide/configuration
- https://packages.klaytn.net/cypress/chaindata/
- https://packages.klaytn.net/baobab/chaindata/

<br>

&nbsp;**For Service-Chain :**

1. **Install/update Klaytn packages (KSCN, KSPN, KSEN)** 
- https://docs.klaytn.com/node/service-chain

2. **Configure Klaytn services**  
- https://docs.klaytn.com/node/service-chain/references/scn/configuration
- https://docs.klaytn.com/node/service-chain/references/bridge-configuration
- https://docs.klaytn.com/node/service-chain/references/anchoring 

3. **Create gensis.json and nodekey via Homi tool** 
- https://docs.klaytn.com/node/service-chain/getting-started/4nodes-setup-guide

&nbsp; ***Example : Setting up a 4-node Service Chain*** - https://docs.klaytn.com/node/service-chain/getting-started/4nodes-setup-guide 


<br>

## Install the collection

`ansible-galaxy collection install klaytndev.klaytn_ansible`

<br>

## Requirements/Dependencies
*None*

<br> 

## Role Variables 

&nbsp; See all default variables in [defaults/main.yml](defaults/main.yml)


### &nbsp; Variable : main-chian 

- Klaytn Pakcage Installation :

&nbsp;&nbsp; As a default, the network is set as **Baobab** in defaults/main.yml   


&nbsp;&nbsp; For setting **Cypress**, the following variable is required when run the role. 

```yml
klaytn_network_NETWORK: "Cypress"  ## OR  klaytn_network_ID : 8217
```  


- Download the chaindata snapshot backed up daily by Klaytn team : 

&nbsp;&nbsp; As a default, downloading chaindata is set as **disable** 

&nbsp;&nbsp; For downloading chaindata, the following variable is required when run the role

```yml
main_chiandata_fastsync: "yes"
```

<br>

### &nbsp; Variable : service-chian 

&nbsp;&nbsp; For creating genesis.json and nodekey, the follwoing variables are requried when run the role

```yml
  service_chain_genesis_generatation: "yes"
  service_chain_key_generation: "yes"
```

<br>

### Useful Optional Varaibles 
variable_name | description 
------------ | -------------
package_installation_only | package install/update only 
configue_update_only | configuration update only 

<br>


## Inventory/host Template 
[Inventory template](inventory)

```bash
#########################################
#  Klaytn Service Chain                 #
#########################################

[ServiceChainCN]
# SCN01         ansible_host=10.11.12.13  ansible_user=MY_USER
# SCN02       ansible_host=1.2.3.4      ansible_user=MY_USER

[ServiceChainPN]
# SPN01
# SPN02

[ServiceChainEN]
# SEN02

###########################################
#  Klaytn Main Chain - Cypress or Baobab  #
###########################################

[CypressCN]
# CN01        ansible_host=127.0.0.1      ansible_user=manager
# CN02        ansible_host=127.0.0.2      ansible_ssh_private_key_file=/home/example/.ssh/aws.pem

[CypressPN]
# PN01
# PN02

[CypressEN]
# EN01

###########################################
#  Klaytn Tool                            #
###########################################

# host where run homi tool
[controller]
builder       ansible_host=localhost      ansible_connection=local
```

<br>

## Example how to run the role 

Main Chain - install/update Klaytn Package for Cypress included chaindata download

```yml
- hosts: all
  roles:
    - role: klaytn_node
  vars:
    klaytn_netowrk_NETWORK_ID: "8217"
    main_chiandata_fastsync: "yes"
```

Service Chain - install pakcage, create genesis.json and nodekey

```yaml
- name: Service Chain - install pacakge, create genesis.json and nodekey
  hosts: all
  become: true
  roles:
    - role: klaytn_node
  vars: 
      service_chain_genesis_generatation: "yes"
      service_chain_key_generation: "yes"
```

```bash
ansible-playbook -i /PATH/TO/YOUR/INVENTORY /PATH/TO/YOUR/PLAYBOOK --private-key /etc/certs/ansible.key --ssh-common-args='-o StrictHostKeyChecking=no'
```

See more in [Tutorial](tutorial/)

<br> 

## License

This modules is licensed under the Apache License, Version 2.0. See [LICENSE](../../LICENSE) for full details.

<br>

## Contributing

Report issues/questions/feature requests on in the [issues](https://github.com/klaytn/klaytn-ansible/issues/new) section


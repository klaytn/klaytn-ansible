Ansible Role : klaytn_grafana
=========

This ansible role enables you to automate grafana configuration for Klaytn.

Requirements
------------

An existing Klaytn network and the node for deploying grafana.
See [klaytn-terraform](https://github.com/klaytn/klaytn-terraform)
if you have not prepared an existing Klaytn network.
Also, the ansible role [klaytn_node](/roles/klaytn_node) allows
you to install/configure Klaytn.

Role Variables
--------------

See all default variables in [defaults/main.yml](defaults/main.yml)

- `prometheus_port`: the port number of the prometheus metrics server in the Klaytn nodes (61001).
Grafana uses this port to collect metrics from the running Klaytn nodes
- `grafana_port`: the port number of the grafana web UI

Dependencies
------------

None

Example Playbook
----------------

```
- name: Grafana_Setup
  hosts: all
  become: true
  roles:
    - role: klaytn_grafana
      grafana_port: "3000"
```

License
-------

MIT

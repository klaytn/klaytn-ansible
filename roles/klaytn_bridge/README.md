Ansible Role : klaytn_bridge
=========

This ansible role enables you to automate bridge configuration for Klaytn.

Requirements
------------

The target node pair for deploying bridge (e.g., one node for
the parent chain and the other for the child chain). See
[klaytn-terraform](https://github.com/klaytn/klaytn-terraform)
if you have not prepared the node pair for deploying bridge.
Also, the ansible role [klaytn_node](/roles/klaytn_node) allows
you to install/configure Klaytn.

Role Variables
--------------

See all default variables in [defaults/main.yml](defaults/main.yml)

- `parent_service_type`: the type of the node for parent chain (e.g., `kend`)
- `child_service_type`: the type of the node for child chain (e.g., `kscnd`)
- `parent_bridge_port`: the bridge port number for the parent chain (main bridge)
- `child_bridge_port`: the bridge port number for the child chain (sub bridge)
- `parent_rpc_port`: the RPC port number for the parent chain node
- `child_rpc_port`: the RPC port number for the child chain node
- `bridge_indexing`: an option to enable child chain transaction
hash indexing
- `bridge_anchoring`: an option to enable data enchoring
- `bridge_anchoring_period`: the period (in block count) for data anchoring
- `parent_chain_id`: the parent chain's chainID
- `gen_bridge_info`: an option to generate `bridge_info.json`,
which can be used for
[value transfer examples](https://github.com/klaytn/servicechain-value-transfer-examples).

Dependencies
------------

None

Example Playbook
----------------

```
- name: Bridge_Setup
  hosts: all
  become: true
  roles:
    - role: klaytn_bridge
      parent_service_type: "kend"
      child_service_type: "kscnd"
```

License
-------

MIT

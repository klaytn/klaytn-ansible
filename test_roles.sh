#!/bin/bash

usage() {
	echo "Usage: $0 <role>"
	echo ""
	echo "Roles:"
	echo "    node: Install and configure Klaytn nodes"
	echo "    bridge: Configure bridge"
	echo "    grafana: Install and configure grafana"
	echo ""
	exit 1
}

run_playbook() {
	role=$1
	playbook=$2
	cp roles/klaytn_$role/tutorial/$playbook .
	ansible-playbook -i roles/klaytn_$role/inventory $playbook
}

target=$1
shift

case "$target" in
	node)
		run_playbook $target service_chain_SCN_setup.yml
		;;
	bridge)
		run_playbook $target bridge_setup.yml
		;;
	grafana)
		run_playbook $target grafana_setup.yml
		;;
	*)
		usage
		;;
esac

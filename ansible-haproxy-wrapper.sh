#!/bin/bash

REF="v1.0"
ROOT=/
MODULE_DIR="ansible-haproxy"

run_ansible() {
  ansible-galaxy remove haproxy_role
  ansible-galaxy install -r requirements.yml
  ansible-playbook haproxy_playbook.yaml --extra-vars "@minions.yaml"
}

cd "$ROOT"
if [[ -d "$MODULE_DIR" ]]; then
        rm -rf "$MODULE_DIR"
else
        git clone https://github.com/ArunaLakmal/ansible-haproxy.git  --branch "$REF" --single-branch
        cd "$MODULE_DIR"
        run_ansible
fi
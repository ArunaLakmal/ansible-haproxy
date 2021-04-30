#!/bin/bash

ansible-galaxy remove haproxy_role
ansible-galaxy install -r requirements.yml
ansible-playbook haproxy_playbook.yaml
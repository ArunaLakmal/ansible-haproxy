#!/bin/bash

HAPROXY_LOC=/run/haproxy/

apt install iproute2 -y
wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /usr/local/bin/systemctl
chmod +x /usr/local/bin/systemctl

if [[ -d "$HAPROXY_LOC" ]]; then
        echo "haproxy.location exists"
else
        mkdir /run/haproxy/
fi
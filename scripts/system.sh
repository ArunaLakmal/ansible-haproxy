#!/bin/bash

apt install iproute2 -y
wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /usr/local/bin/systemctl
mkdir /run/haproxy/
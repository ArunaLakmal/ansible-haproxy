#!/bin/bash

cat scripts/logo.txt
echo "Deploying HAProxy....!!!"
echo "Installing the repository"

sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y

echo "Setting up unit files"

cp units/* /etc/systemd/system/
cp ansible-haproxy-wrapper.sh /usr/local/bin/

systemctl enable lucidwrapper.service
systemctl enable lucidwrapper.timer
systemctl daemon-reload
systemctl start lucidwrapper.service
systemctl start lucidwrapper.timer
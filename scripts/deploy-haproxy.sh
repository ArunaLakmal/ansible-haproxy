#!/bin/bash

cat <<"EOF"
 /$$$$$$$$                  /$$        /$$$$$$                                    /$$       /$$          
|__  $$__/                 | $$       /$$__  $$                                  | $$      | $$          
   | $$  /$$$$$$   /$$$$$$$| $$$$$$$ | $$  \__/  /$$$$$$  /$$   /$$ /$$$$$$/$$$$ | $$$$$$$ | $$  /$$$$$$ 
   | $$ /$$__  $$ /$$_____/| $$__  $$| $$       /$$__  $$| $$  | $$| $$_  $$_  $$| $$__  $$| $$ /$$__  $$
   | $$| $$$$$$$$| $$      | $$  \ $$| $$      | $$  \__/| $$  | $$| $$ \ $$ \ $$| $$  \ $$| $$| $$$$$$$$
   | $$| $$_____/| $$      | $$  | $$| $$    $$| $$      | $$  | $$| $$ | $$ | $$| $$  | $$| $$| $$_____/
   | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$/| $$      |  $$$$$$/| $$ | $$ | $$| $$$$$$$/| $$|  $$$$$$$
   |__/ \_______/ \_______/|__/  |__/ \______/ |__/       \______/ |__/ |__/ |__/|_______/ |__/ \_______/
                                                                                                         
                                                                                                         
                                                                                                         
EOF
echo "Deploying HAProxy....!!!"
echo "Installing the repository"

apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install ansible -y

echo "Setting up unit files"

cp units/* /etc/systemd/system/
cp ansible-haproxy-wrapper.sh /usr/local/bin/

systemctl enable lucidwrapper.service
systemctl enable lucidwrapper.timer
systemctl daemon-reload
systemctl start lucidwrapper.service
systemctl start lucidwrapper.timer
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

HAPROXY_LOC=/run/haproxy/

apt install iproute2 -y
wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /usr/local/bin/systemctl
chmod +x /usr/local/bin/systemctl

if [[ -d "$HAPROXY_LOC" ]]; then
        echo "haproxy location exists"
else
        mkdir /run/haproxy/
fi

apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install ansible -y

echo "Setting up unit files"

cp units/* /etc/systemd/system/
cp ansible-haproxy-wrapper.sh /usr/local/bin/

systemctl enable lucidwrapper.service
systemctl daemon-reload
systemctl start lucidwrapper.service
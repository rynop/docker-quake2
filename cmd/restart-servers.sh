#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

pkill q2proded

cd /opt/docker-quake2
git pull

cd /opt/docker-quake2/baseq2
cp -f ../server-configs/lith* .
cp -f ../server-configs/rocket*.cfg .

ufw allow 27910
ufw allow 27911
ufw allow 27912
ufw allow 27913
ufw allow 27914

su quake2 -c "cd /opt/docker-quake2; nohup ./q2proded +exec lith.cfg +set dedicated 1 +set game lithium >/dev/null 2>&1 &"
# su quake2 -c "cd /opt/docker-quake2; nohup ./q2proded +exec lith-ctf.cfg +set dedicated 1 +set game lithium >/dev/null 2>&1 &"
# su quake2 -c "cd /opt/docker-quake2; nohup ./q2proded +exec lith-ctf-instagib.cfg +set dedicated 1 +set game lithium >/dev/null 2>&1 &"
su quake2 -c "cd /opt/docker-quake2; nohup ./q2proded +exec lith-instagib.cfg +set dedicated 1 +set game lithium >/dev/null 2>&1 &"
# su quake2 -c "cd /opt/docker-quake2; nohup ./q2proded +exec rocket-pro.cfg +set dedicated 1 +set game lithium >/dev/null 2>&1 &"

echo "DONE"
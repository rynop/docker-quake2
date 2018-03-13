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
cp -f ../server-configs/procket.cfg .

su quake2 -c "cd /opt/docker-quake2; nohup ./q2proded +exec lith.cfg +set dedicated 1 +set game lithium >/dev/null 2>&1 &"
su quake2 -c "cd /opt/docker-quake2; nohup ./q2proded +exec lith-ctf.cfg +set dedicated 1 +set game lithium >/dev/null 2>&1 &"
su quake2 -c "cd /opt/docker-quake2; nohup ./q2proded +exec lith-ctf-instagib.cfg +set dedicated 1 +set game lithium >/dev/null 2>&1 &"
su quake2 -c "cd /opt/docker-quake2; nohup ./q2proded +exec lith-instagib.cfg +set dedicated 1 +set game lithium >/dev/null 2>&1 &"
su quake2 -c "cd /opt/docker-quake2; nohup ./q2proded +exec procket.cfg +set dedicated 1 +set game lithium >/dev/null 2>&1 &"

echo "DONE"
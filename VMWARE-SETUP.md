# Simple setup

Create VMWare VM, install ubuntu 17.10 server.  Make sure to setup bridged networking so the VM uses the host's IP.  Make sure all ports (UDP) can make it into the VM.

## Inside the Ubuntu VM do the following:

```
useradd -m -s /bin/bash quake2
sudo mkdir -p /opt/
cd /opt
sudo git clone https://github.com/rynop/docker-quake2.git
sudo apt-get update
sudo apt-get install wget -y
sudo wget http://skuller.net/q2pro/nightly/q2pro-server_linux_amd64.tar.gz -O- | tar zxvf - -C /opt/docker-quake2
sudo chown -R quake2:quake2 /opt/docker-quake2
sudo chmod u+x /opt/docker-quake2/q2proded
sudo ufw allow 27910; sudo ufw allow 27999
```

When you want to start the q2 server run the following.  Note the instagib.cfg server listens on UDP port 27910 and ctfinstagib.cfg listens on 27999

```
sudo su - quake2
cd /opt/docker-quake2
nohup ./q2proded +exec instagib.cfg +set dedicated 1 +set game lithium &
nohup ./q2proded +exec ctfinstagib.cfg +set dedicated 1 +set game lithium &
```

You can verify that UDP ports are open to the world by running:

`nc -cnzu <IP> 27910`

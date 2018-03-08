# Simple setup

Create VMWare VM, install ubuntu 17.10 server.  Make sure to setup bridged networking so the VM uses the host's IP.  Make sure all ports (UDP) can make it into the VM.

## Inside the Ubuntu VM do the following:

1.  Install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
1.  Inside the VM run the following:

```
sudo mkdir -p /opt/
sudo git clone https://github.com/rynop/docker-quake2.git
sudo apt-get update
sudo apt-get install wget -y
wget http://skuller.net/q2pro/nightly/q2pro-server_linux_amd64.tar.gz -O- | tar zxvf - -C /opt/docker-quake2
sudo chmod u+x /opt/docker-quake2/q2proded
sudo ufw allow 27910; sudo ufw allow 27999
```

3.  When you want to start the q2 server run:
```
cd /opt/docker-quake2
//instagib server listens on port 27910
nohup ./q2proded +exec instagib.cfg +set dedicated 1 +set game lithium &
//CTF instagib server listens on port 27999
nohup ./q2proded +exec ctfinstagib.cfg +set dedicated 1 +set game lithium &
```

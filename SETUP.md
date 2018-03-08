# Simple setup

1.  Install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
1.  Install Docker CE on your host machine: [Windows](https://docs.docker.com/docker-for-windows/install/) OR [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
1.  Clone this repo: `git clone https://github.com/rynop/docker-quake2.git`
1.  Create docker instagib container: `sudo docker build --rm -t quake2/instagib .`
1.  create docker CTF container: 
    1.  `git checkout ctf`
    1.  `sudo docker build --rm -t quake2/ctf .`
1.  If ubuntu host, open firewall: `sudo ufw allow 27910; sudo ufw allow 27999`
1.  Start servers: 
    *  Instagib: `sudo docker run --network=bridge -d -p 27910:27910/udp quake2/instagib`
    *  CTF: `sudo docker run --network=bridge -d -p 27999:27910/udp quake2/ctf`
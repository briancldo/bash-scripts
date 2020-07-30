#!/bin/bash

### ----- Packages ----- ###

sudo apt-get update

# git
sudo apt-get install git &&
echo 'Sucessfully installed git' || echo 'Failed installing git'

# curl
sudo apt install curl &&
echo 'Sucessfully installed cURL' || echo 'Failed installing cURL'

# fullscreen
sudo apt-get install virtualbox-dkms &&
sudo apt-get install virtualbox-guest-dkms &&
sudo apt-get remove libcheese-gtk23 &&
sudo apt-get install xserver-xorg-core &&
sudo apt-get install virtualbox-guest-x11 &&
echo 'Sucessfully installed fullscreen software' || echo 'Failed installing fullscreen software'

# docker repo
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88 >> grep '0EBFCD88' && echo 'Docker repo successfully installed' || echo 'Docker repo installation failed'
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# docker engine
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world >> grep 'Hello from Docker!' && echo 'Docker engine sucessfully installed' || echo 'Docker engine installation failed'

sudo-less docker
sudo groupadd docker
sudo gpasswd -a $USER docker
/usr/bin/newgrp docker <<EONG
docker ps && echo 'Successfull configured sudo-less docker' || 'Failed configuring sudo-less docker'

# brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
brew --version && echo 'Sucessfully installed brew' || echo 'Failed installing brew'

# sam cli
brew tap aws/tap
brew install aws-sam-cli
sam --version &&echo 'Sucessfully installed AWS SAM' || echo 'Failed installing AWS SAM'

echo "'Packages' section complete. Note the installation results, and don't forget to reboot"


### ----- Applications ----- ###

cd ~/Downloads

# chrome
curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# pycharm community
sudo snap install pycharm-community --classic
echo "Pycharm: to get the application icon, run 'pycharm-community' and from the toolbar, right click and select 'Add to Favorites'"

# discord
curl -O https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb

# vscode
curl -O https://az764295.vo.msecnd.net/stable/91899dcef7b8110878ea59626991a18c8a6a1b3e/code_1.47.3-1595520028_amd64.deb

# keepass
curl -O http://ftp.us.debian.org/debian/pool/main/k/keepass2/keepass2_2.45+dfsg-1_all.deb

sudo apt install ./*.deb
sudo apt-get update

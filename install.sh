#!/bin/bash

sudo apt remove docker docker.io containerd runc

#Adding Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg 

# Setting repository:
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update your Ubuntu as well:
sudo apt update -y
sudo apt-cache policy docker-ce

# Install docker with compose plugin:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose

# Setting Rootless mode:
sudo usermod -aG docker $(whoami)

# If need to check status and version of docker
sudo systemctl status docker 
docker -v

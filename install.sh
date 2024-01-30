#!/bin/bash

# Update Software Repositories
sudo apt update

# Install Prerequisites
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s Official GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker Repository to APT Sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update Software Repositories Again
sudo apt update

sudo apt install ansible-core
sudo apt install ansible
sudo apt install tree 
sudo apt install jq
# Install Docker
sudo apt install -y docker-ce

# Check Docker Version
docker --version

# Execute Docker Command Without Sudo (Optional)
sudo usermod -aG docker ${USER}
sudo usermod -aG docker $USER
newgrp docker
echo "Docker installation is complete."
echo "You might need to log out and log back in to apply the Docker group changes."
echo "Test Docker with: 'docker run hello-world'"

# Get the latest available tag from Containerlab's GitHub releases
echo "deb [trusted=yes] https://apt.fury.io/netdevops/ /" | \
sudo tee -a /etc/apt/sources.list.d/netdevops.list

sudo apt update && sudo apt install containerlab

# netmiko install 
sudo apt-get update
sudo apt-get install python3 python3-pip -y
pip install netmiko

sudo apt-get install build-essential libssl-dev libffi-dev python3-dev -y

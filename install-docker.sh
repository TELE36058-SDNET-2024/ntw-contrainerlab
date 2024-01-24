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


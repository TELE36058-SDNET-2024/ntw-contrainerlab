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
LATEST=$(curl -s https://github.com/srl-labs/containerlab/releases/latest | \
       sed -e 's/.*tag\/v\(.*\)\".*/\1/')

echo "Latest version of Containerlab: $LATEST"

# Download the tar.gz archive of the latest Containerlab release
curl -L -o /tmp/clab.tar.gz "https://github.com/srl-labs/containerlab/releases/download/v${LATEST}/containerlab_${LATEST}_Linux_amd64.tar.gz"

# Create containerlab directory
mkdir -p /etc/containerlab

# Extract downloaded archive into the containerlab directory
tar -zxvf /tmp/clab.tar.gz -C /etc/containerlab

# (Optional) Move containerlab binary somewhere in the $PATH and set executable permissions
mv /etc/containerlab/containerlab /usr/bin && chmod a+x /usr/bin/containerlab  

echo "Containerlab installation is complete."


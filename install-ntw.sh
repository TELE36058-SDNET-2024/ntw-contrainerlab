#!/bin/bash

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


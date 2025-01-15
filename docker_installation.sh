#!/bin/bash

# Update the package list
echo "Updating system packages..."
sudo apt update -y

# Install required dependencies
echo "Installing dependencies..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
echo "Adding Docker's GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "Adding Docker repository..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list again to include Docker packages
echo "Updating package list..."
sudo apt update -y

# Install Docker
echo "Installing Docker..."
sudo apt install -y docker-ce

# Start Docker service
echo "Starting Docker service..."
sudo systemctl start docker

# Enable Docker to start on boot
echo "Enabling Docker to start on boot..."
sudo systemctl enable docker

# Verify Docker installation
echo "Verifying Docker installation..."
sudo docker --version

# Optional: Add user to docker group for non-sudo access
echo "Adding current user to docker group (for non-sudo access)..."
sudo usermod -aG docker $USER

# Prompt to log out and log back in for the user group changes to take effect
echo "Installation complete! Please log out and log back in for changes to take effect."

#!/bin/bash

# Update the system package list and upgrade all packages
echo "Updating system package list and upgrading all packages..."
sudo apt update && sudo apt upgrade -y

# Install Java
echo "Installing OpenJDK 11..."
sudo apt install openjdk-11-jdk -y

# Verify Java installation
java -version

# Add Jenkins repository key to the system
echo "Adding Jenkins repository key..."
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# Add Jenkins repository to the package list
echo "Adding Jenkins repository to the package list..."
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update package list
echo "Updating package list..."
sudo apt update

# Install Jenkins
echo "Installing Jenkins..."
sudo apt install jenkins -y

# Start Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins

# Enable Jenkins to start on boot
echo "Enabling Jenkins to start on boot..."
sudo systemctl enable jenkins

# Adjust firewall to allow Jenkins through port 8080 (if UFW is enabled)
echo "Configuring firewall to allow Jenkins through port 8080..."
sudo ufw allow 8080
sudo ufw status

# Display initial Jenkins admin password
echo "Displaying initial Jenkins admin password..."
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Jenkins installation complete. Access Jenkins at http://your_server_ip_or_domain:8080"

#! /usr/bin/bash

#Update Your System
sudo apt update
sudo apt upgrade -y

#Install Java
sudo apt install openjdk-11-jdk -y

#Add Jenkins Repository
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

#Then, add the Jenkins repository to the package list.
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

#Now Install Jenkins
sudo apt update
sudo apt install jenkins -y

#Start and Enable Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

#Then see the jenkins status
sudo systemctl status jenkins 
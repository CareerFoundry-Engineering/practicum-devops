#!/bin/bash
sudo yum upgrade -y
sudo yum install git -y
git clone https://github.com/CareerFoundry-Engineering/practicum-devops.git
sudo yum install docker -y
sudo chkconfig docker on
sudo service docker start
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker ec2-user
sudo reboot

#!/bin/bash
sudo yum upgrade -y
sudo yum install git -y
sudo amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo curl -sL https://rpm.nodesource.com/setup_16.x | sudo -E bash -
sudo yum install nodejs --enablerepo=nodesource -y
sudo npm install yarn -g
sudo npm install serve -g
sudo npm install pm2 -g
git clone https://github.com/CareerFoundry-Engineering/practicum-devops.git
cd practicum-devops/learning/
yarn

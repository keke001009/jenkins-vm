#!/bin/bash

echo "=======docker install======="
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

sudo usermod -aG docker vagrant
# sudo usermod -aG docker $USER

echo "=======docker-compose install======="
sudo curl -L https://github.com/docker/compose/releases/download/1.25.0-rc2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "=======jenkins container======="
docker-compose up -d

sleep 1m
echo "=======jenkins password======="
docker exec jenkins cat var/jenkins_home/secrets/initialAdminPassword
#!/bin/bash

sudo apt update
# shellcheck disable=SC2046
sudo apt install -y $(cat libs.txt)
sudo apt upgrade -y

# docker

if [ ! -e "/etc/apt/keyrings/docker.gpg" ]; then
    echo "Installing docker"

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
    sudo groupadd docker
    sudo usermod -aG docker "$USER"

fi

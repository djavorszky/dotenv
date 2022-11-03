#!/bin/bash

sudo apt update
# shellcheck disable=SC2046
sudo apt install -y $(cat libs.txt)
sudo apt upgrade -y

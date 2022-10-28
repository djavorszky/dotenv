#!/bin/env bash

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install md.obsidian.Obsidian -y

curl -fsSL https://code.visualstudio.com/sha/download?build=stable\&os=linux-deb-x64 -o code.deb

sudo dpkg -i code.deb
rm code.deb

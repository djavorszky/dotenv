sudo apt update
sudo apt install -y $(cat libs.txt)
sudo apt upgrade -y

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install md.obsidian.Obsidian -y


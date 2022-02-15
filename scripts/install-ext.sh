# oh-my-zsh
if [ ! -e ~/.oh-my-zsh ]; then
  echo "installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi



# Install node:
if [ ! -e ~/apps/node ]; then
  echo "installing node"
  mkdir -p ~/apps
  cd ~/apps

  curl -fsSL https://nodejs.org/dist/v17.5.0/node-v17.5.0-linux-x64.tar.xz -o node.tar.gz

  tar xf node.tar.gz
  rm node.tar.gz
  mv node-* node
fi

if [ ! -e ~/.cargo]; then
  mkdir -p ~/apps
  cd ~/apps
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-install.sh
  chmod +x rustup-install.sh
  ./rustup-install.sh -y
  rm rustup-install.sh
fi

# set git stuff
git config --global user.name "Daniel Javorszky"
git config --global user.email daniel.javorszky@gmail.com
git config --global core.editor "vim"

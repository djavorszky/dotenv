APPS=~/apps

mkdir -p $APPS

# oh-my-zsh
if [ ! -e ~/.oh-my-zsh ]; then
  echo "installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi


# Node:
if [ ! -e $APPS/node ]; then
  NODE_VERSION=v19.0.0
  echo "installing node"

  cd $APPS

  curl -fsSL https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.xz -o node.tar.gz

  tar xf node.tar.gz
  rm node.tar.gz
  mv node-* node
fi

# Rust
if [ ! -e ~/.cargo ]; then
  cd $APPS

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-install.sh
  chmod +x rustup-install.sh
  ./rustup-install.sh -y
  rm rustup-install.sh
fi

# Neovim
if [ ! -e $APPS/nvim ]; then
  echo "installing neovim"
  cd $APPS

  NVIM_VERSION=v0.8.0

  curl -fsSL https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.tar.gz -o nvim-linux64.tar.gz

  tar xzf nvim-linux64.tar.gz
  rm nvim-linux64.tar.gz
  mv nvim-linux64 nvim
fi

# Starship
if [ ! -e $APPS/bin/starship ]; then
  echo "Installing starship"
  mkdir $APPS/bin
  curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir=$APPS/bin -y
fi

# Rust Analyzer
if [ ! -e $APPS/bin/rust-analyzer ]; then
  echo "Installing Rust Analyzer"
  mkdir -p $APPS/bin
  curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > $APPS/bin/rust-analyzer

  chmod +x $APPS/bin/rust-analyzer
fi







# set git stuff
git config --global user.name "Daniel Javorszky"
git config --global user.email daniel.javorszky@gmail.com
git config --global core.editor "vim"

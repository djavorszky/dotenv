#!/bin/bash

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

  cd $APPS || exit

  curl -fsSL https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.xz -o node.tar.gz

  tar xf node.tar.gz
  rm node.tar.gz
  mv node-* node
fi

# Rust
if [ ! -e ~/.cargo ]; then
  cd $APPS || exit

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-install.sh
  chmod +x rustup-install.sh
  ./rustup-install.sh -y
  rm rustup-install.sh
fi

# Neovim
if [ ! -e $APPS/nvim ]; then
  echo "installing neovim"
  cd $APPS || exit

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

# Twitch cli
if [ ! -e $APPS/bin/twitch ]; then
	echo "Installing Twitch CLI"
	mkdir -p $APPS/bin

	cd $APPS/bin || exit

	curl -fsSL https://github.com/twitchdev/twitch-cli/releases/download/v1.1.12/twitch-cli_1.1.12_Linux_x86_64.tar.gz -o twitch.tar.gz
	tar xzf twitch.tar.gz
	rm twitch.tar.gz
	mv twitch-cli*/twitch .
	rm -rf twitch-cli*
fi


# flyctl
if [ ! -e "$HOME/.fly" ]; then
	curl -L https://fly.io/install.sh | sh
fi


# sccache
if [ ! -e "$APPS/bin/sccache" ]; then
	echo "Installing sccache"
	mkdir -p $APPS/bin

	cd $APPS/bin || exit

	curl -fsSL https://github.com/mozilla/sccache/releases/download/v0.3.0/sccache-v0.3.0-x86_64-unknown-linux-musl.tar.gz -o sccache.tar.gz
	tar xzf sccache.tar.gz
	mv sccache-*/sccache sccache
	rm -rf sccache.tar.gz sccache-*
	chmod +x sccache
fi

# just
if [ ! -e "$APPS/bin/just" ]; then
	echo "Installing just"
	mkdir -p $APPS/bin

	cd $APPS/bin || exit
	curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to $APPS/bin
fi

#!/bin/bash

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua

dirname="$(dirname "$(realpath "$0")")"
cp "$dirname/init.lua" ~/.config/nvim
cp -r "$dirname/lua" ~/.config/nvim


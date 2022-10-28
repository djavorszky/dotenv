mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim

dirname=$(dirname $(realpath $0))
cp $dirname/init.lua ~/.config/nvim


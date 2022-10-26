mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/user

dirname=$(dirname $(realpath $0))
cp $dirname/init.lua ~/.config/nvim
cp $dirname/rust.lua ~/.config/nvim


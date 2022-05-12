#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

echo installing pre-requisites
while read -r p ; do sudo dnf install -y $p ; done < <(cat << "EOF"
	neovim
	git
	nodejs
	fzf
	ranger
    python3-pip
EOF
)

echo install pip and npm packages
pip install pynvim
npm i -g neovim

 
echo Install language servers
while read -r p ; do npm i -g $p ; done < <(cat << "EOF"
	typescript typescript-language-server
	bash-language-server
	pyright
EOF
)

echo Install plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo Copy the files
if [ -d $(test -d ~/.config/nvim) ]
then
    mv ~/.config/nvim ~/.config/nvim-swap
    git clone https://github.com/TechWithOmid/neovim-conf.git ~/.config/nvim
else
    git clone https://github.com/TechWithOmid/neovim-conf.git ~/.config/nvim
fi

echo done.


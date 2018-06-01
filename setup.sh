#!/bin/bash

cd ..
mv dotfiles .dotfiles
ln -s ~/.dotfiles/bash/bash_profile ~/.bash_profile
mkdir ~/.config
mkdir ~/.config/nvim
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
source ~/.bash_profile

#!/bin/bash
# run after cloning for the first time
cd ..
mv dotfiles ~/.dotfiles
ln -s ~/.dotfiles/bash/bash_profile ~/.bash_profile
mkdir -p ~/.config/nvim
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/bash/git-prompt-colors.sh ~/.git-prompt-colors.sh 
ln -s ~/.dotfiles/fish/ ../.config/fish
source ~/.bash_profile

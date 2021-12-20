#!/bin/bash
# macOS

# first install: 
# - homebrew
# - tmux
# - ohmyzsh

# uncomment if using a new system

# cp .zshrc ~/.zshrc
# cp .gitconfig ~/.gitconfig

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

DIRNAME=$PWD

##
cd

# tmux conf
ln -s $DIRNAME/.tmux/.tmux.conf
ln -s $DIRNAME/.tmux/.tmux.conf.local

# vim conf
ln -s $DIRNAME/.vim
ln -s $DIRNAME/.vim/.vimrc
ln -s $DIRNAME/.vim/.vimrc.local

## 

####
cd -

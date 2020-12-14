#!/bin/bash
# ubuntu 18

SOFTWARES="curl vim tmux zsh"
sudo apt install $SOFTWARES
DIRNAME=$PWD

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

##
cd

# tmux conf
if [ -f "tmux.conf" ]; then
	mv .tmux.conf .tmux.conf.bak
fi
ln -s $HOME/.tmux.conf
ln -s $HOME/.tmux.conf.local

# zsh conf
if [ -f ".zshrc" ]; then
	mv .zshrc .zshrc.bak
fi
cp $DIRNAME/.zshrc .zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# vim conf
if [ -f ".vimrc" ]; then
	mv .vimrc .vimrc.bak
fi
ln -s $DIRNAME/.vim
ln -s $HOME/.vim/.vimrc
ln -s $HOME/.vim/.vimrc.local

# git conf
if [ -f ".gitconfig" ]; then
	mv .gitconfig .gitconfig.bak
fi
ln -s $DIRNAME/.gitconfig


####
cd -

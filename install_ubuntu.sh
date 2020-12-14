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
ln -s $DIRNAME/.tmux
ln -s $HOME/.tmux/.tmux.conf
ln -s $HOME/.tmux/.tmux.conf.local

# zsh conf
if [ -f ".zshrc" ]; then
	mv .zshrc .zshrc.bak
fi
cp $DIRNAME/.zshrc .zshrc
if [ ! -d "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# vim conf
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

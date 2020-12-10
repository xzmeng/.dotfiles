#!/bin/bash
# ubuntu 18

SOFTWARES="curl vim tmux zsh"
sudo apt install $SOFTWARES
DIRNAME=$PWD

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

##
cd

# oh my tmux
if [ -f "tmux.conf" ]; then
	mv .tmux.conf .tmux.conf.bak
fi
ln -s -f $DIRNAME/.tmux.conf
ln -s -f $DIRNAME/.tmux.conf.local

# zsh
if [ -f ".zshrc" ]; then
	mv .zshrc .zshrc.bak
fi
cp $DIRNAME/.zshrc .zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# vim
if [ -f ".vimrc" ]; then
	mv .vimrc .vimrc.bak
fi
ln -s -f $DIRNAME/.vimrc

# git
if [ -f ".gitconfig" ]; then
	mv .gitconfig .gitconfig.bak
fi
ln -s -f $DIRNAME/.gitconfig


####
cd -

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

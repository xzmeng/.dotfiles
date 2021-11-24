#!/bin/bash
# ubuntu 20

# tomezone
sudo timedatectl set-timezone Asia/Shanghai

SOFTWARES="curl vim tmux zsh"
sudo apt install -y $SOFTWARES
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
if [ ! -d "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
sed -i 's/plugins=(git)/plugins=(git docker docker-compose zsh-autosuggestions z)/' ~/.zshrc

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

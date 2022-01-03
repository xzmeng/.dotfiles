#!/bin/bash

# tomezone
sudo timedatectl set-timezone Asia/Shanghai

# softwares
SOFTWARES="tmux zsh"
sudo apt update && sudo apt install -y $SOFTWARES

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# ohmyzsh theme
sed -i 's/ZSH_THEME=.*/ZSH_THEME="gallifrey"/' ~/.zshrc
# ohmyzsh plugins
if [ ! -d "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
sed -i 's/plugins=(.*/plugins=(git docker docker-compose zsh-autosuggestions z)/' ~/.zshrc

## to home dir
DIRNAME=$PWD
cd

# tmux conf
ln -s $DIRNAME/.tmux/.tmux.conf
ln -s $DIRNAME/.tmux/.tmux.conf.local

# vim conf
ln -s $DIRNAME/.vim
ln -s $DIRNAME/.vim/.vimrc
ln -s $DIRNAME/.vim/.vimrc.local

# git conf
if [ -f ".gitconfig" ]; then
	mv .gitconfig .gitconfig.bak
fi

ln -s $DIRNAME/.gitconfig

##
cd -

echo "finished."
#!/bin/bash

# for gitpod

# timezone
sudo echo /Asia/Shanghai > /etc/timezone
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# ohmyzsh theme
sed -i 's/ZSH_THEME=.*/ZSH_THEME="gallifrey"/' ~/.zshrc
# ohmyzsh plugins
if [ ! -d "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
sed -i 's/^plugins=(.*/plugins=(docker docker-compose zsh-autosuggestions z)/' ~/.zshrc

# git
cp ~/.dotfiles/.gitconfig ~/.gitconfig

# pyenv
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

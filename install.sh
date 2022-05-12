#!/bin/bash

# for gitpod

# timezone
sudo timedatectl set-timezone Asia/Shanghai

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# ohmyzsh theme
sed -i 's/ZSH_THEME=.*/ZSH_THEME="gallifrey"/' ~/.zshrc
# ohmyzsh plugins
if [ ! -d "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
sed -i 's/plugins=(.*/plugins=(git docker docker-compose zsh-autosuggestions z)/' ~/.zshrc

# git
cp .gitconfig ~/.gitconfig
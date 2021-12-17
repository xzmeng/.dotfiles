#!/bin/bash

# tomezone
sudo timedatectl set-timezone Asia/Shanghai

# vscode
extensions=(
  eamodio.gitlens
  ms-python.python
)
if command -v code;then
  for ext in ${extensions[@]};do
    code --install-extension $ext
  done
fi

# softwares
SOFTWARES="tmux zsh"
sudo apt update && sudo apt install -y $SOFTWARES

# docker
if ! command -v docker;then
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo usermod -aG docker $USER
  rm get-docker.sh
fi

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
echo "If you are using vscode, kill vscode server and restart to use docker"
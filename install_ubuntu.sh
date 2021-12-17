#!/bin/bash

# tomezone
sudo timedatectl set-timezone Asia/Shanghai

# vscode
extensions=(
  eamodio.gitlens
  ms-python.python
  mutantdino.resourcemonitor
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

# pyenv
if [ ! -d "$HOME/.pyenv" ];then
  sudo apt-get update; sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  cd ~/.pyenv && src/configure && make -C src && cd -

  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
  echo 'eval "$(pyenv init --path)"' >> ~/.zprofile

  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
  echo 'eval "$(pyenv init --path)"' >> ~/.profile

  echo 'eval "$(pyenv init -)"' >> ~/.zshrc
  # python build dependencies
  sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

  # pyenv-virtualenv
  git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
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
echo "If you are using vscode, kill vscode server and restart (docker, pyenv)"
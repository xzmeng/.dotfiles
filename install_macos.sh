#!/bin/bash
# macOS

DIRNAME=$PWD

##
cd

# tmux conf
ln -s $DIRNAME/.tmux
ln -s $HOME/.tmux/.tmux.conf
ln -s $HOME/.tmux/.tmux.conf.local

# vim conf
ln -s $DIRNAME/.vim
ln -s $HOME/.vim/.vimrc
ln -s $HOME/.vim/.vimrc.local

####
cd -

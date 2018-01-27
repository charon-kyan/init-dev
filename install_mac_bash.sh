#!/bin/bash

BASHRC=$HOME/.profile.local
cp -f ./zsh/profile.local $BASHRC

## vim
brew install vim --with-lua
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
cat ./zsh/vimrc.local.append >> $HOME/.vimrc.local
cat ./zsh/vimrc.bundles.local.append >> $HOME/.vimrc.bundles.local


## tmux
brew install tmux
git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux && \
    ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf && \
    cp $HOME/.tmux/.tmux.conf.local $HOME && \
    cat ./zsh/tmux.conf.local.append >> $HOME/.tmux.conf.local

## zsh
brew install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && \
    cp ./zsh/zshrc.oh-my-zsh $HOME/.zshrc

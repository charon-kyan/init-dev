#!/bin/bash

yum install -y epel-release wget git make cmake gcc zip unzip

BASHRC=$HOME/.profile.local
cp -f ./zsh/profile.local $BASHRC

## java
yum install -y java maven
git clone https://github.com/gcuisinier/jenv.git $HOME/.jenv && \
    echo '#### java' >> $BASHRC && \
    echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> $BASHRC && \
    echo 'eval "$(jenv init -)"' >> $BASHRC


## python
git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv && \
    echo '#### python' >> $BASHRC && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $BASHRC && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $BASHRC && \
    echo 'eval "$(pyenv init -)"' >> $BASHRC
#    pyenv install 2.7.13 && \
#    pyenv install 3.6.0


## ruby
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv && \
    echo '#### ruby' >> $BASHRC && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $BASHRC

git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
#    rbenv install 2.2.0 \


## scala
# RUN wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.rpm && \
#    yum install -y scala-2.11.8.rpm

curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo && \
    yum install -y sbt


## vim
yum install -y vim
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
cat ./zsh/vimrc.local.append >> $HOME/.vimrc.local


## tmux
yum install -y tmux
git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux && \
    ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf && \
    cp $HOME/.tmux/.tmux.conf.local $HOME/ && \
    cat ./zsh/tmux.conf.local.append >> $HOME/.tmux.conf.local

## zsh
yum install -y zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && \
    cp ./zsh/zshrc.oh-my-zsh $HOME/.zshrc


## tools
yum -y install tree htop peco psmisc gitflow


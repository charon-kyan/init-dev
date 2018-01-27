#!/bin/bash

BASHRC=$HOME/.profile.local

HOMEBREW_NO_AUTO_UPDATE=1

## eava
git clone https://github.com/gcuisinier/jenv.git $HOME/.jenv && \
    echo "" >> $BASHRC && \
    echo '#### java' >> $BASHRC && \
    echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> $BASHRC && \
    echo 'eval "$(jenv init -)"' >> $BASHRC

## python
git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv && \
    echo "" >> $BASHRC && \
    echo '#### python' >> $BASHRC && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $BASHRC && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $BASHRC && \
    echo 'eval "$(pyenv init -)"' >> $BASHRC
#    pyenv install 2.7.13 && \
#    pyenv install 3.6.0


## ruby
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv && \
    echo "" >> $BASHRC && \
    echo '#### ruby' >> $BASHRC && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $BASHRC

git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
#    rbenv install 2.2.0 \


## scala
git clone git://github.com/scalaenv/scalaenv.git ~/.scalaenv && \
    echo "" >> $BASHRC && \
    echo '#### scala' >> $BASHRC && \
    echo 'export PATH="${HOME}/.scalaenv/bin:${PATH}"' >> ~/$BASHRC && \
    echo 'eval "$(scalaenv init -)"' >> $BASHRC

# scalaenv install scala-2.11.12

## sbt
git clone git://github.com/sbtenv/sbtenv.git ~/.sbtenv && \
    echo "" >> $BASHRC && \
    echo '#### scala' >> $BASHRC && \
    echo 'export PATH="${HOME}/.sbtenv/bin:${PATH}"' >> $BASHRC && \
    echo 'eval "$(sbtenv init -)"' >> $BASHRC

# wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.rpm && \
#    yum install scala-2.11.8.rpm

# curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo && \
#    yum install sbt


## Go
brew install go

## Nodejs
brew install node

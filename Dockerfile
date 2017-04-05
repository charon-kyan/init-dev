FROM centos
MAINTAINER yankunpeng<charon.yan@qq.com>

ENV HOME /root
ENV CURDIR /temp/docker

RUN mkdir -p $CURDIR
COPY . $CURDIR

WORKDIR $CURDIR

## base
RUN cd /etc/yum.repos.d && curl http://mirrors.163.com/.help/CentOS7-Base-163.repo > CentOS-Base.repo
RUN yum install -y epel-release wget git make cmake gcc zip unzip


ENV BASHRC $HOME/.profile.local
RUN cp -f ./zsh/profile.local $BASHRC

## java
RUN yum install -y java maven
RUN git clone https://github.com/gcuisinier/jenv.git $HOME/.jenv && \
    echo '#### java' >> $BASHRC && \
    echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> $BASHRC && \
    echo 'eval "$(jenv init -)"' >> $BASHRC


## python
RUN git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv && \
    echo '#### python' >> $BASHRC && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $BASHRC && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $BASHRC && \
    echo 'eval "$(pyenv init -)"' >> $BASHRC
#    pyenv install 2.7.13 && \
#    pyenv install 3.6.0


## ruby
RUN git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv && \
    echo '#### ruby' >> $BASHRC && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $BASHRC

RUN git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
#    rbenv install 2.2.0 \


## scala
# RUN wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.rpm && \
#    yum install -y scala-2.11.8.rpm

RUN curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo && \
    yum install -y sbt


## vim
RUN yum install -y vim
RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
RUN cat ./zsh/vimrc.local.append >> $HOME/.vimrc.local


## tmux
RUN yum install -y tmux
RUN git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux && \
    ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf && \
    cp $HOME/.tmux/.tmux.conf.local $HOME/ && \
    cat ./zsh/tmux.conf.local.append >> $HOME/.tmux.conf.local

## zsh
RUN yum install -y zsh
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && \
    cp ./zsh/zshrc.oh-my-zsh $HOME/.zshrc


## tools
RUN yum -y install tree htop peco psmisc gitflow


WORKDIR $HOME
CMD ["zsh"]


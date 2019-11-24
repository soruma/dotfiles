FROM ubuntu:19.10
ENV LANG C.UTF-8

ENV TERM xterm
ENV ZPLUG_HOME $HOME/.zplug

WORKDIR /root

RUN set -x && \
    apt update && \
    apt install -y \
        curl \
        emacs \
        git \
        openjdk-14-jdk \
        ruby \
        zsh && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/zplug/zplug $ZPLUG_HOME && \
    gem install homesick && \
    homesick clone soruma/dotfiles && \
    homesick link dotfiles && \
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv && \
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

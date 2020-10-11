FROM ubuntu:19.10
ENV LANG C.UTF-8

ENV TERM xterm

RUN set -x && \
    apt update && \
    apt install -y \
        curl \
        build-essential \
        emacs \
        git \
        openjdk-14-jdk \
        ruby \
        sudo \
        vim \
        zsh && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 developer && \
    useradd  -g      developer -G sudo -m -s /bin/bash testuser && \
    echo 'testuser:hogehoge' | chpasswd

RUN echo 'Defaults visiblepw'              >> /etc/sudoers
RUN echo 'testuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER testuser
WORKDIR /home/testuser

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

RUN set -x && \
    echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/testuser/.profile && \
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv) && \
    brew install rbenv ruby-build pyenv ndenv node-build; exit 0

RUN sudo apt update && sudo apt install -y zlib1g-dev

RUN set -x && \
    . /home/testuser/.profile && \
    eval "$(rbenv init -)" && \
    rbenv install 2.7.1 && \
    rbenv global 2.7.1 && \
    git clone https://github.com/zplug/zplug .zplug && \
    gem install homesick && \
    homesick clone soruma/dotfiles && \
    homesick link dotfiles

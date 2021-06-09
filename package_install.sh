#!/bin/bash

set -x
if [ $(uname) = "Darwin" ]; then
    xcode-select --install
elif [ $(uname) = "Linux" ]; then
    sudo apt update
    sudo apt install -y curl build-essential git sudo zlib1g-dev
    sudo apt install -y emacs
    sudo apt clean
    sudo rm -rf /var/lib/apt/lists/*
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> ~/.bash_profile
echo 'export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"' >> ~/.bash_profile
source ~/.bash_profile

brew bundle
if [ $(uname) = "Darwin" ]; then
    brew bundle --file macOS_Brewfile
    if [ $(uname -a | egrep --only-matching 'arm64') ]; then
       softwareupdate --install-rosetta
    fi
elif [ $(uname) = "Linux" ]; then
    brew bundle --file linux_Brewfile
fi

echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
anyenv init
anyenv install --init
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv update
anyenv install rbenv
rbenv install 3.0.1
exec $SHELL -l

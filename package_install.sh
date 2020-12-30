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
fi

rbenv install 3.0.0
rbenv global 3.0.0
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

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
eval "$(/opt/homebrew/bin/brew shellenv)"

brew bundle
if [ $(uname) = "Darwin" ]; then
    if [ $(uname -a | egrep --only-matching 'arm64') ]; then
       softwareupdate --install-rosetta
    fi
    brew bundle --file macOS_Brewfile
elif [ $(uname) = "Linux" ]; then
    brew bundle --file linux_Brewfile
fi

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

eval "$(anyenv init -)"
anyenv install --init
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv update
anyenv install rbenv
eval "$(anyenv init -)"
rbenv install 3.0.1
rbenv global 3.0.1

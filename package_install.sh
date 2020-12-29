#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> ~/.bash_profile
echo 'export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"' >> ~/.bash_profile
source ~/.bash_profile

brew bundle

rbenv install 3.0.0
rbenv global 3.0.0
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Install packages using Brewfile
brew bundle

# Install ruby
eval "$(rbenv init -)"
rbenv install 2.7.1
rbenv global 2.7.1

# Setting dotfiles
gem install homesick
homesick clone soruma/dotfiles

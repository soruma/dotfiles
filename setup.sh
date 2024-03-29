#!/bin/bash

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(anyenv init -)"

which ruby > /dev/null
if [ $? = 1 ]; then
    echo "Please install of ruby"
    exit 1
fi

# Setting dotfiles
sudo gem install homesick
homesick clone soruma/dotfiles
homesick link dotfiles

# Setting default shell
sudo chsh -s $(which zsh)

git config --global user.name "soruma"
git config --global user.email "soruma.net@gmail.com"
git config --global core.excludesfile ~/.gitignore_global

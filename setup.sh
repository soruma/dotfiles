#!/bin/bash

source ~/.bash_profile

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

rm ~/.bash_profile

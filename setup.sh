#!/bin/bash

source ~/.bash_profile

which ruby > /dev/null
if [ $? = 1 ]; then
    echo "Please install of ruby"
    exit 1
fi

# Setting dotfiles
gem install homesick
homesick clone soruma/dotfiles
homesick link dotfiles

# -*- mode: sh -*-
if [ "$(uname)" = "Darwin" ]; then
    OS="Mac"
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    OS="Linux"
fi

if [ $OS = "Mac" ]; then
    export EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
else
    export EDITOR="emacs"
fi

# Java
export PATH="$HOME/.jenv/bin:$PATH"

# TeX
export PATH="/Library/TeX/texbin:$PATH"

# Ruby
if [ -e {$HOME/.rbenv/shims:$PATH} ]; then
    export PATH="$HOME/.rbenv/shims:$PATH"
else
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

# pyenv
if [ -e {$HOME/.pyenv/shims:$PATH} ]; then
    export PATH="$HOME/.pyenv/shims:$PATH"
else
    export PATH="$HOME/.pyenv/bin:$PATH"
fi

# ndenv(Node.js)
if [ -e {$HOME/.ndenv/shims:$PATH} ]; then
    export PATH="$HOME/.ndenv/shims:$PATH"
else
    export PATH="$HOME/.ndenv/bin:$PATH"
fi

# exenv(Elixir)
export PATH="$HOME/.exenv/bin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

# homeshick
export HOMESHICK_DIR=/usr/local/opt/homeshick

# ZSH
export ZDOTDIR="$HOME/"
if [ $OS = "Linux" ]; then
    export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
fi

# ImageMagick
export PKG_CONFIG_PATH=/opt/ImageMagick/lib/pkgconfig
export PATH=/usr/local/Cellar/openssl/1.0.2t/bin:$PATH
export PATH=/usr/local/opt/imagemagick@6/bin:$PATH

export PATH="/usr/local/opt/texinfo/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# Git
export PATH=/usr/local/Cellar/git/2.14.1/bin:$PATH

# Emacs package download
export PATH=$PATH:/usr/local/Cellar/openssl/1.0.2t/bin

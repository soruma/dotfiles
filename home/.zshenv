# -*- mode: sh -*-
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

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

# homeshick
export HOMESHICK_DIR=/usr/local/opt/homeshick

# ZSH
export ZDOTDIR="$HOME/"

# ImageMagick
export PKG_CONFIG_PATH=/opt/ImageMagick/lib/pkgconfig
export PATH=/usr/local/Cellar/openssl/1.0.2t/bin:$PATH
export PATH=/usr/local/opt/imagemagick@6/bin:$PATH

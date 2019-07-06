# -*- mode: sh -*-
# Java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# TeX
export PATH="/Library/TeX/texbin:$PATH"

# Ruby
if [ -e {$HOME/.rbenv/shims:$PATH} ]; then
    export PATH="$HOME/.rbenv/shims:$PATH"
else
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

# ZSH
export ZDOTDIR="$HOME/"

# -*- mode: sh -*-
# install zplug
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

# Can manage local plugins
zplug "~/.zsh", from:local

# Load theme file
zplug "themes/theunraveler", from:oh-my-zsh

# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "zsh-users/zsh-autosuggestions", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

#peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    BUFFER=$(\history -n 1 | \
        eval $tac | \
        awk '!a[$0]++' | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# cdの後にlsを実行
chpwd() { ls -trg }

# Load nvm
if [[ -s $HOME/.nvm/nvm.sh ]] ; then source $HOME/.nvm/nvm.sh ; fi

# emacsでZSHを使う
[[ $EMACS = t ]] && unsetopt zle

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# rbenv
eval "$(rbenv init - zsh)"

# pyenv
eval "$(pyenv init -)"

# homeshick
source "$HOMESHICK_DIR/homeshick.sh"

# load .zshrc_*
[ -f $ZDOTDIR/.zshrc_alias ] && . $ZDOTDIR/.zshrc_alias

# -*- mode: sh -*-
if [ $(uname) = "Darwin" ]; then
    OS="Mac"
elif [ $(uname) = "Linux" ]; then
    OS="Linux"
fi

# initialize zplug
source $ZPLUG_HOME/init.zsh

# Load local alias
source ~/.zsh/.zshrc_alias

# This plugin adds many useful aliases and functions.
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/prompt_info_functions", from:oh-my-zsh

# Load theme file
zplug "themes/amuse", from:oh-my-zsh

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

# git hack
function isWinDir {
    case $PWD/ in
	/mnt/*) return $(true);;
	*) return $(false);;
    esac
}
# wrap the git command to either run windows git or linux
function git {
    if isWinDir
    then
	git.exe "$@"
    else
	/usr/bin/git "$@"
    fi
}

# emacsでZSHを使う
[[ $EMACS = t ]] && unsetopt zle

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# homebrew
if [ $OS = "Linux" ]; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# anyenv
eval "$(anyenv init -)"

export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# load .zshrc_*
[ -f $ZDOTDIR/.zshrc_alias ] && . $ZDOTDIR/.zshrc_alias

# overwrite theme
PROMPT='
%{$fg_bold[green]%}%m %~%{$reset_color%}$(git_prompt_info) ⌚ %{$fg_bold[red]%}%*%{$reset_color%}
$ '

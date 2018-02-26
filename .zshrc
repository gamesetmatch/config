# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line
bindkey '^W' backward-kill-word
bindkey '^F' forward-word
bindkey '^B' backward-word
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ssiddha/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors

# %T for time
export PROMPT="
%{$fg[yellow]%}(%D{%d-%m-%Y}) [%~] $program %{$fg[default]%}
%{$fg[blue]%}%n@%{$fg[blue]%}%m %#%{$fg[default]%} "

export RPROMPT=
  
set-title() {
    echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

if [ -f ~/.zsh_alias ]; then
    source ~/.zsh_alias
fi

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:*:git:*' script ~/git-completion.bash

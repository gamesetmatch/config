# Backward word-byword delete
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word

# word navigation
bindkey ^W my-backward-delete-word
bindkey ^f forward-word
bindkey ^b backward-word
bindkey ^U backward-kill-line

# zsh history search, this binds dp and down keys to a history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# customise prompt
autoload -U colors && colors

source "$(brew --prefix)/opt/zsh-git-prompt/zshrc.sh"
export PROMPT='
%{$fg[blue]%}%B%n%b@%{$fg[blue]%}%B%m%b %{$fg[yellow]%}[%~] $(git_super_status) %{$fg[default]%}$ '

#PROMPT='$(git_super_status) %# '
# line drawing https://superuser.com/a/846133
setopt promptsubst
PS1="%{$fg[green]%}%U${(r:$COLUMNS:: :)}%u $PS1"

export AUTO_TITLE_SCREENS="NO"
export RPROMPT="%{$fg[red]%}[%T %D{%d-%m-%Y}]%{$reset_color%}"
export TERM=xterm
export JAVA_HOME=$(/usr/libexec/java_home)
export NODE_HOME=/usr/local/bin/node

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

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
#setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

# case insensitive matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit -i

# thefuck
eval $(thefuck --alias)
eval $(thefuck --alias --enable-experimental-instant-mode)

json_escape () {
    printf '\n'
    printf '%s' "$1" | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))'
}

json_unescape () {
    printf '\n'
    printf '%s' "$1" | python -c 'import sys; print(sys.stdin.read().decode("unicode-escape"))'
}

ws

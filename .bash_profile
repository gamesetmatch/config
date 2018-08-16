if [ -f ~/.bash_alias ]; then
    source ~/.bash_alias
fi

export PS1="\n\[\033[0;32m\](\D{%d-%m-%Y}) \[\033[0;34m\]\u@\H \[\033[0;33m\][\w] \[\033[0;29m\]\$\[\033[0m\] "

shopt -s cdspell
bind 'set completion-ignore-case on'

source ~/git-completion.bash

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

export XDG_CONFIG_HOME=$HOME/.config

# Global exports
export EDITOR=vim

# Complete
complete -cf sudo
complete -cf man

# Bash history opts
HISTCONTROL=ignoreboth
shopt -s histappend

# Bash Completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Alias definitions.
if [ -x ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Function definitions.
if [ -x ~/.bash_functions ]; then
  . ~/.bash_functions
fi

# Prompt definitions.
if [ -x ~/.bash_prompt ]; then
  . ~/.bash_prompt
fi

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

color_prompt=yes

# Handy aliases
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'

# Color man pages
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

source ~/.config/setup.sh

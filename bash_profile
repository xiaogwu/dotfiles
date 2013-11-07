# Set command line editing to vi mode
set -o vi

# PATH
export PATH=''
export PATH="/usr/local/bin" # Make Homebrew first
export PATH="$PATH:~/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/MacOS/bin" # Add Postgres
export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin" # System
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM bin to $PATH
export PATH="$PATH:/usr/local/share/npm/bin" # Add npm apps

# System Exports
export VISUAL=vim
export EDITOR=vi

# History Setup
export HISTFILESIZE=10000
export HISTSIZE=10000
shopt -s histappend
export PROMPT_COMMAND='history -a'
export HISTIGNORE="&:[ ]*:exit:?:??"
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T '

# Functions
mkcd () { mkdir -p "$@" && cd "$@"; }

# System Aliases
alias h='history'
alias ls='ls -F'
alias l='ls'
alias la='l -a'
alias ll='ls -l'
alias lla='ll -a'
alias lltr='ll -tr'
alias llrt='ll -rt'
alias llart='ll -art'
alias ..='cd ..'

# Convenience Aliases
alias ebp="vim $HOME/.bash_profile"
alias evrc="vim $HOME/.vimrc"
alias emvrc="vim $HOME/vimified/after.vimrc"
alias sbp="source $HOME/.bash_profile"
alias egc="vim $HOME/.gitconfig"
alias buc="brew update && brew outdated"
alias bud="brew upgrade && brew cleanup && brew doctor"

# Application Aliases
alias git=hub
alias type='type -a'
alias sqlite3='/usr/local/Cellar/sqlite/*/bin/sqlite3'
alias pyss="python -m SimpleHTTPServer $@"

# Prompt
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
export GIT_PS1_SHOWDIRTYSTATE=1

PS1='\[\033[1;34m\]\u\[\033[0m\]@\h:\W$(__git_ps1 "(%s)")\$ '

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/contrib/ps1_functions" ]] && source "$HOME/.rvm/contrib/ps1_functions"
ps1_set
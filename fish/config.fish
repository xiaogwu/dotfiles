set fish_config_path $HOME/.config/fish

if which brew >/dev/null
    set PATH (brew --prefix)/bin (brew --prefix)/sbin $HOME/.rvm/bin /usr/local/share/npm/bin $HOME/bin $PATH
end

set fish_greeting ""

set -U EDITOR vim

# Functions
function mkdir -d "Create a directory and set CWD"
    command mkdir -p $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end

function pyss -d "Start a Simple HTTP Server"
    command python -m SimpleHTTPServer $argv
end

function gbr -d "Display git branches in ascending order"
    for k in (git branch | perl -pe s/^..//)
        echo -e (git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1) \\t $k
    end | sort
end

function gbrr -d "Display git branches in descending order"
    for k in (git branch | perl -pe s/^..//)
        echo -e (git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1) \\t $k
    end | sort -r
end

# System Aliases
alias h='history'
alias l='ls'
alias la='l -a'
alias lf='ls -F'
alias ll='ls -l'
alias lla='ll -a'
alias lltr='ll -tr'
alias llrt='ll -rt'
alias llart='ll -art'

#Convenience Aliases
alias ebp="vim $HOME/.bash_profile"
alias evrc="vim $HOME/.vimrc"
alias emvrc="vim $HOME/vimified/after.vimrc"
alias sbp="source $HOME/.bash_profile"
alias egc="vim $HOME/.gitconfig"
alias buc="brew update; and brew outdated"
alias bud="brew upgrade; and brew cleanup; and brew doctor"
alias bup="brew update; and brew outdated; and brew upgrade; and brew cleanup; and brew doctor"

# Application Aliases
alias git=hub
alias type='type -a'
alias sqlite3='/usr/local/Cellar/sqlite/*/bin/sqlite3'


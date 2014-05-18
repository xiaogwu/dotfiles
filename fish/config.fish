set fish_config_path $HOME/.config/fish

if which brew >/dev/null
    set PATH (brew --prefix)/bin (brew --prefix)/sbin $HOME/.rvm/bin /usr/local/share/npm/bin $HOME/bin /Applications/adt-bundle-mac-x86_64-20140321/sdk/tools /Applications/adt-bundle-mac-x86_64-20140321/sdk/platform-tools $PATH
end

# Variables
set fish_greeting ""
set -U EDITOR vim

# Export Variables
set -x ANDROID_SDK_DIR '/Applications/adt-bundle-mac-x86_64-20140321/sdk'
set -x SALESFORCE_SDK_DIR '/Users/xiao.wu/Dropbox/dev/SFDC/SalesforceMobileSDK-Android'
set -x NATIVE_DIR "$SALESFORCE_SDK_DIR/native"
set -x HYBRID_DIR "$SALESFORCE_SDK_DIR/hybrid"

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

function sfc -d "Source fish config"
    command source $HOME/.config/fish/fish.config
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
alias sbp="source $HOME/.bash_profile"
alias evrc="vim $HOME/.vimrc"
alias emvrc="vim $HOME/vimified/after.vimrc"
alias egc="vim $HOME/.gitconfig"
alias efc="vim $HOME/.config/fish/config.fish"
alias sfc=". $HOME/.config/fish/config.fish"
alias buc="brew update; and brew outdated"
alias bud="brew upgrade; and brew cleanup; and brew doctor"
alias bup="brew update; and brew outdated; and brew upgrade; and brew cleanup; and brew doctor"

# Application Aliases
alias git=hub
alias type='type -a'
alias sqlite3='/usr/local/Cellar/sqlite/*/bin/sqlite3'
alias ag='ag -i'
alias curl='/usr/local/Cellar/curl/*/bin/curl'
alias ant='/usr/local/Cellar/ant/*/bin/ant'
alias eclipse='/Applications/adt-bundle-mac-x86_64-20140321/eclipse/Eclipse.app/Contents/MacOS/eclipse'

rvm >/dev/null

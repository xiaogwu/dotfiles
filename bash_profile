# Set command line editing mode
set -o vi

#Functions
mkcd () { mkdir -p "$@" && cd "$@"; }

#Aliases
alias h='history'
alias ls='ls -F'
alias l='ls'
alias la='l -a'
alias ll='ls -l'
alias lla='ll -a'
alias lltr='ll -tr'
alias llrt='ll -rt'
alias llart='ll -art'
#alias ebp="mvim $HOME/.bash_profile"
alias ebp="subl $HOME/.bash_profile"
alias sbp="source $HOME/.bash_profile"
alias evrc="mvim $HOME/.vimrc"

#Application Aliases
alias vim='/usr/local/Cellar/macvim/*/MacVim.app/Contents/MacOS/Vim'
alias mvimt='mvim --remote-tab'
alias sqlite3='/usr/local/Cellar/sqlite/*/bin/sqlite3'
eval "$(hub alias -s)"

#Git Aliases
#alias gb='git branch'
#alias gc='git commit -v'
#alias gca='git commit -a -v'
#alias gco='git checkout'
#alias gd='git diff'
#alias gdc='git diff --cached'
#alias gdh='git diff HEAD'
#alias gP='git push'
#alias gp='git pull'
#alias gpr='git pull --rebase'
#alias gs='git status'
#alias gap='git add -p'
#alias glg='git log --pretty=oneline --abbrev-commit'

#virtualenv aliases
#alias ve='workon'
#alias ve.deactivate='deactivate'
#alias ve.mk='mkvirtualenv --no-site-packages'
#alias ve.mk_withsitepackages='mkvirtualenv'
#alias ve.rm='rmvirtualenv'
#alias ve.switch='workon'
#alias ve.add2virtualenv='add2virtualenv'
#alias ve.cdsitepackages='cdsitepackages'
#alias ve.cd='cdvirtualenv'
#alias ve.lssitepackages='lssitepackages'

#Server aliases
#alias hills='ssh xwu77@hills.ccsf.edu'
#alias alarm='ssh root@alarm'

#JUnit Test
#alias test_junit='java org.junit.runner.JUnitCore org.junit.tests.AllTests'

#JUNIT
#export JUNIT_HOME="/Developer/junit/current"

#CLASSPATH
#export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit-4.9.jar:$JUNIT_HOME"
#export CLASSPATH="$CLASSPATH:$JUNIT_HOME/current.jar:$JUNIT_HOME"

#PATH
# export PATH="/Developer/Applications/Google/android-sdk-mac_x86/tools:/Developer/Applications/Google/android-sdk-mac_x86/platform-tools:~/bin:$JUNIT_HOME:${PATH}:$HOME/.rvm/bin:~/bin"

# Android Development Tools
export PATH="${PATH}:/Applications/adt-bundle-mac-x86_64-20130219/sdk/tools:/Applications/adt-bundle-mac-x86_64-20130219/sdk/platform-tools"

#$HOME bin and Applications Path
export PATH="${PATH}:~/bin:~/Applications"

#Prompt
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
export GIT_PS1_SHOWDIRTYSTATE=1
#source ~/.git-completion.sh
#source /usr/local/Cellar/git/*/etc/bash_completion.d/git-completion.bash
#source /usr/local/Cellar/git/*/etc/bash_completion.d/git-prompt.sh
PS1='\[\033[1;34m\]\u\[\033[0m\]@\h:\w$(__git_ps1 "(%s)")\$ '
# PS1='\u@\h:\W$(__git_ps1 "(%s)")\$ '

#Preferred Editor
export EDITOR=vim
export VISUAL=mvim

#RVM
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#rbenv
#eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#Virtualenv
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Development
#source /usr/local/share/python/virtualenvwrapper.sh

#Startup commands
# Update brew if any formulaes are outdated
#[ -n "$(brew outdated --quiet)" ] && brew upgrade

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"
export PATH="${PATH}:/usr/local/heroku/bin"

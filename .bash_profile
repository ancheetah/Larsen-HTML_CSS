
#!bin/bash

#Add commands to PATH for SASS, Dart, ESLint, icu4c, and Node.js
#export NODE_PATH="/usr/local/bin:/usr/local/lib/node_modules"
#export PATH=$PATH":/Users/AJ"

# Terminal Commands
#------------------

alias cp='cp -ivp'
alias mv='mv -iv'
alias mkdir='mkdir -vp'
alias tedit='open -a TextEdit'
alias sublime='open -a SublimeText'
alias vscode='open -a "Visual Studio Code.app"'
alias chrome='open -a "Google Chrome.app"'
alias finder='open -a Finder ./' #open current directory in Finder
alias rm='echo "rm is disabled, use trash or dl instead"'
alias dl='trash -v'
cdls() { builtin cd "$@" && ls -a; }


#Terminal Colors
#---------------

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#Github
#------

#Create a new repository in the current directory
alias newrepo='~/bashscripts/newrepo.sh'
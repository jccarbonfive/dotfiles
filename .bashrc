# vi command line editing
set -o vi

# aliases
alias ..='cd ..'
alias ...='cd ../../'
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ls='ls -lhF'
alias la='ls -lahF'
alias rm='rm -rf'
alias ruby='ruby -Itest'

# prompt
export CLICOLOR=yes
export TERM=xterm-color
alias RED='tput setaf 1'
alias YELLOW='tput setaf 3'
alias RESET='tput sgr0'
function __rvm_ps1 {
  if ~/.rvm/bin/rvm-prompt s | grep system -v > /dev/null 
  then
    printf "(%s) " "$(~/.rvm/bin/rvm-prompt i v g)"
  fi
}
export PS1='\[$(RED)\]$(__rvm_ps1)\[$(RESET)\]\w\[$(YELLOW)\]$(__git_ps1)\[$(RESET)\] $ '

# variables
export EDITOR=vi

# git
source ~/.git-completion.bash

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# hitch
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

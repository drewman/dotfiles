# adds everything you can think of to my path
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH:$HOME/bin
# android path
#export ANDROID=$HOME/lib/android-sdk-macosx
# adds android tools to path
#export PATH=$PATH:$ANDROID/tools:$ANDROID/platform-tools
# automatically uses --distribute flag for virtualenv
export VIRTUALENV_USE_DISTRIBUTE=true
# dev directory
export DEV=$HOME/dev/
#virtualenvs
export WORKON_HOME=$HOME/envs

# Returns "*" if the current git branch is dirty.
function parse_git_dirty 
{
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

# Get the current git branch name (if available)
git_prompt() 
{
  local ref=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)
  if [ "$ref" != "" ]
  then
    echo " ($ref$(parse_git_dirty))"
  fi
}

# colorful terminal
cyan='\e[1;36m'
yellow='\e[1;33m'
blue='\e[1;34m'
pink='\e[1;35m'
PS1='\[\e[1;36m\][\[\e[1;34m\]\u@\h \[\e[1;33m\]\W\[\e[1;31m\]$(git_prompt)\[\e[1;36m\]]\[\e[1;35m\] $ \[\e[0m\]'
PS2='\[\e[1;35m-> \[\e[0m\]'

source ~/bin/git-completion.bash
source /usr/local/bin/virtualenvwrapper.sh

alias x='exit'
alias ix='ssh drew@cs.uoregon.edu'
alias lo='logout'
alias ls='ls -p'
alias ll='ls -ltr'
alias la='ls -A'
alias act='source ../env/bin/activate'
alias mailserver='python python -m smtpd -n -c DebuggingServer localhost:1025'


# adding bash completion after installing bash_completion with brew
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

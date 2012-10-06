# adds everything you can think of to my path
export PATH=/usr/local/share/python:/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH:$HOME/bin


export VIRTUALENV_USE_DISTRIBUTE=true
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


#source ~/bin/git-completion.bash
source /usr/local/share/python/virtualenvwrapper.sh


alias ls='ls -p'
alias ll='ls -ltr'
alias la='ls -A'


# adding bash completion after installing bash_completion with brew
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

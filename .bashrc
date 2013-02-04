# adds everything you can think of to my path
# first argument due to brew installing python with --framework
export PATH=$PATH:/usr/local/share/python:/usr/local/share/npm/bin:$HOME/bin
export NODE_PATH=/usr/local/lib/node

# my favorite line ever
export PYTHONDONTWRITEBYTECODE=1

export VIRTUALENV_USE_DISTRIBUTE=true
export WORKON_HOME=$HOME/envs

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# for use with autoenv
use_env() {
  typeset venv
  venv="$1"
  if [[ `basename "${VIRTUAL_ENV:t}"` != "$venv" ]]; then
    if workon | grep $venv > /dev/null; then
      workon "$venv"
    else
      echo -n "Create virtualenv $venv now? (Yn) "
      read answer
      if [[ "$answer" == "Y" ]]; then
        mkvirtualenv "$venv"
      fi
    fi
  fi
}


# sources:
source $HOME/etc/git-prompt.sh
source $HOME/etc/git-completion.bash
source $HOME/etc/django_bash_completion
source /usr/local/share/python/activate.sh
source /usr/local/share/python/virtualenvwrapper.sh

# colorful terminal
cyan='\e[1;36m'
yellow='\e[1;33m'
blue='\e[1;34m'
pink='\e[1;35m'
PS1='\[\e[1;36m\][\[\e[1;34m\]\u@\h \[\e[1;33m\]\W\[\e[1;31m\]$(__git_ps1)\[\e[1;36m\]]\[\e[1;35m\] $ \[\e[0m\]'
PS2='\[\e[1;35m-> \[\e[0m\]'

# aliases:
alias ls='ls -p'
alias ll='ls -ltr'
alias la='ls -A'

#enable bash-vi mode
set -o vi

# adding bash completion after installing bash_completion with brew
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi


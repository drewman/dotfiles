# add local bin to end of path
export PATH=$PATH:$HOME/bin

# my favorite line ever
export PYTHONDONTWRITEBYTECODE=1

# virtualenv{wrapper}
export VIRTUALENV_USE_DISTRIBUTE=true
export WORKON_HOME=$HOME/envs
[[ -r $HOME/.local/bin/virtualenvwrapper.sh ]] && source $HOME/.local/bin/virtualenvwrapper.sh

# git prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

#git prompt
[[ -r $HOME/etc/git-prompt.sh ]] && source $HOME/etc/git-prompt.sh

# colorful terminal
PS1='\[\e[1;36m\][\[\e[1;34m\]\u@\h \[\e[1;33m\]\W\[\e[1;31m\]$(__git_ps1)\[\e[1;36m\]]\[\e[1;35m\] $ \[\e[0m\]'
PS2='\[\e[1;35m-> \[\e[0m\]'

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# aliases:
alias ls='ls -p'
alias ll='ls -ltr'
alias la='ls -A'

#enable bash-vi mode
set -o vi

# auto-completions:
[[ -r $HOME/etc/git-completion]] && source $HOME/etc/git-completion.bash
[[ -r $HOME/etc/django_bash_completion ]] && source $HOME/etc/django_bash_completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && source "/usr/local/etc/profile.d/bash_completion.sh"

# pyenv
[[ -n $(which pyenv) ]] && eval "$(pyenv init -)"


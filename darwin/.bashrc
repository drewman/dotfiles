# aliases:
alias ls='ls -p'
alias ll='ls -ltr'
alias la='ls -A'

#enable bash-vi mode
set -o vi

# source venvwrapper
[[ -r $HOME/.local/bin/virtualenvwrapper.sh ]] && source $HOME/.local/bin/virtualenvwrapper.sh
# auto-completions:
[[ -r $HOME/etc/git-completion ]] && source $HOME/etc/git-completion.bash
[[ -r $HOME/etc/django_bash_completion ]] && source $HOME/etc/django_bash_completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && source "/usr/local/etc/profile.d/bash_completion.sh"

# pyenv
[[ -n $(which pyenv) ]] && eval "$(pyenv init -)"

eval "$(starship init bash)"

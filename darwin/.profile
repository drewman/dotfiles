#!/usr/bin/env bash

# system specific env variables go here
export GIT_AUTHOR_EMAIL="drew.bruce@nike.com"
export DEFAULT_USER=dbruc1

export PATH="/usr/local/sbin:$PATH:/Library/TeX/texbin:$HOME/.emacs.d/bin:$HOME/bin"
export SDKMAN_DIR="$HOME/.sdkman"

export AUTOENV_ENABLE_LEAVE="t"

# python
export PYTHONDONTWRITEBYTECODE=1
export WORKON_HOME=$HOME/.pyenv/versions
export VIRTUALENV_USE_DISTRIBUTE=true
export VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/shims/python
# zsh/bash shared environment variables go here
# add ~/bin to end of path


#!/usr/bin/env zsh

if [ -f ~/.profile ]; then
    emulate bash -c 'source ~/.profile'
fi

export KEYTIMEOUT=1

# history
export HIST_STAMPS="mm/dd/yyyy"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE         # Dont record an entry starting with a space.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

export ZSH="$HOME/.oh-my-zsh"

export EDITOR=vim

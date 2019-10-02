#!/bin/bash

echo "Install xcode cli tools"
xcode-select --install

if [ -z $(which brew) ]
then
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing packages I always want"
brew update
brew install wget
brew install awscli
brew install bash-completion
brew install pyenv
brew install pipenv
brew install virtualenvwrapper

mkdir $HOME/etc
if [ ! -f $HOME/etc/git-prompt.sh ]
then
    echo "wget git-prompt"
    wget -P $HOME/etc/ https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

if [ ! -f $HOME/etc/git-completion.bash ]
then
    echo "wget git-completion"
    wget -P $HOME/etc/ https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi

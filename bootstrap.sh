#!/bin/bash

if [ $(uname) -eq "Darwin" && -z $(which xcode-select) ]
then
    echo "Xcode required! Install through applestore and rerun"
fi

rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "brew.sh" \
        -avh --no-perms . ~

if [[ $(uname) -eq "Darwin" ]]
then
    ./brew.sh
    #sdkman confirmed useful :D
    curl -s "https://get.sdkman.io" | bash
fi

source ~/.zshrc

echo Remember to add $(which zsh) to your /etc/shells
echo then run: chsh -s $(which zsh)


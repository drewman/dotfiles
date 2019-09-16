#!/bin/bash

if [ $(uname) -eq "Darwin" && -z $(which xcode-select)]
    echo "Xcode required! Install through applestore and rerun"
fi

rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "brew.sh" \
        -avh --no-perms . ~

if [ $(uname) -eq "Darwin" ]
    ./brew.sh
fi

source ~/.bash_profile

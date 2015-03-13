#!/bin/bash

ostype=`uname`
if [ $ostype == 'Linux' ]; then
    echo Linux
elif [ $unamestr == 'Darwin' ]; then
    echo Mac
fi

echo -e "\nInstalling dotfiles:"
sudo pip install dotfiles

cp dotfilesrc ~/.dotfilesrc
tools/fix_dotfilesrc_repo.sh
dotfiles --add ~/.dotfilesrc

#dotfiles --sync -R ~/.dotfiles

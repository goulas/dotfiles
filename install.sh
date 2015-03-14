#!/bin/bash

ostype=""       #Operating system type

function inst_dotfiles {
    echo -e "\nInstalling dotfiles:"
    sudo pip install dotfiles
}

function inst_flake8 {
    echo -e "\nInstalling flake8:"
    if [ $ostype == 'Linux' ]; then
        sudo apt-get install python-flake8
    elif [ $ostype == 'Darwin' ]; then
        sudo pip install flake8
    fi
}

function get_ostype {
    ostype=`uname`
    if [ $ostype == 'Linux' ]; then
        echo Linux
    elif [ $ostype == 'Darwin' ]; then
        echo Mac
    fi
}

get_ostype
inst_dotfiles
inst_flake8

cp dotfilesrc ~/.dotfilesrc
tools/fix_dotfilesrc_repo.sh
dotfiles --add ~/.dotfilesrc

echo -e "\nInstalling vim plugins"
vim +PluginInstall +qall
#dotfiles --sync -R ~/.dotfiles

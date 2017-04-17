#!/bin/bash
set -eu
set -x
ostype=""       #Operating system type

function inst_dotfiles {
    if [ $ostype == 'Linux' ]; then
        sudo apt-get install -y python-pip
    fi
    echo -e "\nInstalling dotfiles:"
    if [ $ostype == 'Linux' ]; then
        sudo pip install dotfiles
    elif [ $ostype == 'Darwin' ]; then
        pip install dotfiles
    fi
}

function inst_flake8 {
    echo -e "\nInstalling flake8:"
    if [ $ostype == 'Linux' ]; then
        sudo apt-get install python-flake8
    elif [ $ostype == 'Darwin' ]; then
        pip install flake8
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

[[ ! -f ~/.dotfilesrc ]] && cp dotfilesrc ~/.dotfilesrc
tools/fix_dotfilesrc_repo.sh
dotfiles --add ~/.dotfilesrc
[[ ! -d ~/.vim/bundle/Vundle.vim ]] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


echo -e "\nInstalling vim plugins"
vim +PluginInstall +qall
dotfiles --sync -R ~/Documents/dotfiles

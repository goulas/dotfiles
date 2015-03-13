#!/bin/bash

echo -e "Refreshing dotfiles\n"

echo -e "\nUpdating from repository"
git pull origin master

echo -e "\nFixing dotfilesrc, just in case"
tools/fix_dotfilesrc_repo.sh

echo -e "\nSynchronize dot files"
dotfiles --sync

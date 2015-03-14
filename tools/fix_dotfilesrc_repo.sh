#!/bin/bash

# Important:
# This script is supposed to be executed from the dotfiles directory.
# The dotfiles directory is the one that should be in the repository parameter.

# Protect current working directory string for sed
esccwd=$(printf '%s\n' "`pwd`" | sed 's/[[\.*/]/\\&/g; s/$$/\\&/; s/^^/\\&/')
echo -e "\nPutting current directory in .dotfilesrc"
sed -i -e "s/repository *=.*/repository = ${esccwd}/g" ~/.dotfilesrc

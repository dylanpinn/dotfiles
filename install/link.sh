#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

echo -e "\n\nCreating vim symlinks"
echo "=============================="
VIMFILES=( "$HOME/.vim:$DOTFILES/vim/.vim"
        "$HOME/.vimrc:$DOTFILES/vim/.vimrc" )

for file in "${VIMFILES[@]}"; do
    KEY=${file%%:*}
    VALUE=${file#*:}
    if [ -e ${KEY} ]; then
        echo "${KEY} already exists... skipping."
    else
        echo "Creating symlink for $KEY"
        ln -s ${VALUE} ${KEY}
    fi
done

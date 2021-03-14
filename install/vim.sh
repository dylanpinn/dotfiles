#!/usr/bin/env bash

# Check if vim has been setup
if [ ! -d "$HOME/.vim/pack/minpac/opt/minpac" ]; then
  # If not install it
  git clone https://github.com/k-takata/minpac.git \
    ~/.vim/pack/minpac/opt/minpac
fi

echo "vim setup"

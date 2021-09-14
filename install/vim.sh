#!/usr/bin/env bash
#
# Setup Vim package manager Minpac
# https://github.com/k-takata/minpac

# Check if minpac has already been installed
if [ ! -d "$HOME/.vim/pack/minpac/opt/minpac" ]; then
  # If not install it
  git clone https://github.com/k-takata/minpac.git \
    ~/.vim/pack/minpac/opt/minpac
fi

echo "Vim successfully setup."

#!/usr/bin/env bash

echo "Setting up dotfiles...."

echo "Installing dependencies.."
brew bundle --verbose

echo "Symlinking dotfiles..."
env RCRC="$HOME/.dotfiles/rcrc" rcup -v

echo "Setting up vim..."
mkdir -p ~/.vim/{backfiles,swap,undo}

[ ! -d "$HOME/.vim/pack/minpac/opt/minpac" ] && \
  git clone https://github.com/k-takata/minpac.git \
  ~/.vim/pack/minpac/opt/minpac

echo "Setting up nvm..."
# NOTE: Try to keep this version up-to date.
[ ! -d "$HOME/.nvm" ] && \
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

echo "Setting up emacs-doom..."
[ ! -d "$HOME/.emacs.d" ] && \
  git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d && \
  ~/.emacs.d/bin/doom install

echo "Setting up yarn..."
[ ! -d "$HOME/.yarn" ] && \
  curl -o- -L https://yarnpkg.com/install.sh | bash

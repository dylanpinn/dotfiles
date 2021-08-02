#!/usr/bin/env sh

# Set XDG defaults.
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share

# Set vim as default editor.
export EDITOR="vim"

# Add dotfiles bin to PATH
export PATH="$HOME/.bin:$PATH"

# Set NVM directory.
export NVM_DIR="$XDG_DATA_HOME/nvm"

# Add yarn to PATH.
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Move Wakatime config out of home directory.
export WAKATIME_HOME="$HOME/.config/wakatime"

# Add Doom Emacs to PATH.
export PATH="$HOME/.emacs.d/bin:$PATH"

# Install pyenv into XDG path.
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"

# Load all supplementaty scripts in ~/.profile.d
for sh in "$HOME"/.profile.d/*.sh; do
  [ -e "$sh" ] || continue
  # shellcheck source=/dev/null
  . "$sh"
done
unset -v sh

# vim: set syntax=sh:

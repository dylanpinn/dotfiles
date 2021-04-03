#!/usr/bin/env sh

# Set XDG defaults.
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_RUNTIME_DIR=/tmp

# Add ~/.local/bin to PATH if it exists
if [ -d "$HOME"/.local/bin ]; then
  PATH=$HOME/.local/bin:$PATH
fi

# Load all supplementaty scripts in ~/.profile.d
for sh in "$HOME"/.profile.d/*.sh; do
  [ -e "$sh" ] || continue
  # shellcheck source=/dev/null
  . "$sh"
done
unset -v sh

# Set vim as default editor.
export EDITOR="vim"

# Set NVM directory.
export NVM_DIR="$XDG_DATA_HOME/nvm"

# Move Wakatime config out of home directory.
export WAKATIME_HOME="$HOME/.config/wakatime"

# Install pyenv into XDG path.
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"

# Load rbenv
# TODO: Look at ways to make this lazy load.
eval "$(rbenv init -)"

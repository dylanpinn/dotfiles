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

# If ~/.shinit exists, set ENV to that
if [ -f "$HOME"/.shinit ]; then
  ENV=$HOME/.shinit
  export ENV
fi

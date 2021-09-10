#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# If ENV is set, source it to get all the POSIX-compatible interactive stuff;
# we should be able to do this even if we're running a truly ancient Bash
if [ -n "$ENV" ]; then
  # shellcheck source=/dev/null
  . "$ENV"
fi

# Load Bash-specific startup files
for bash in "$HOME"/.bashrc.d/*.bash; do
  [[ -e $bash ]] || continue
  # shellcheck source=/dev/null
  source "$bash"
done
unset -v bash

# Local customized path and environment settings, etc.
if [ -f ~/.bashrc.local ]; then
  # shellcheck source=/dev/null
  . ~/.bashrc.local
fi
source "$XDG_DATA_HOME/.rea-cli/rea-shell-init.sh"

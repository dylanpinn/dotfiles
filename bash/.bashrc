#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

if [ -f /etc/bashrc ]; then
  # shellcheck source=/dev/null
  . /etc/bashrc # --> Read /etc/bashrc, if present.
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

#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

if [ -f /etc/bashrc ]; then
  . /etc/bashrc # --> Read /etc/bashrc, if present.
fi

# Load Bash-specific startup files
for bash in "$HOME"/.bashrc.d/*.bash ; do
  [[ -e $bash ]] || continue
  source "$bash"
done
unset -v bash

# Local customized path and environment settings, etc.
if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi

export NVM_DIR="$HOME/.nvm"

# Lazy load nvm
nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm $@
}

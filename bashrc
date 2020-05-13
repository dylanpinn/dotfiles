#!/usr/bin/env bash
# ===========================================================#
#
# Personal $HOME/.bashrc
# using bash-5.0
#
# By Dylan Pinn
#
# Contains:
# - aliases
# - functions
# - shell options
# - prompt settings
# ===========================================================#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

if [ -f /etc/bashrc ]; then
  . /etc/bashrc # --> Read /etc/bashrc, if present.
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Bash completion.
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export NVM_DIR="$HOME/.nvm"

# Lazy load nvm
nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                    # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
  nvm $@
}

# Prompt
# ~/pwd (git-branch)$
# TODO: Replace with native PS1 and implement colours that way.
PROMPT_COMMAND='__git_ps1 "\w" "\$ " " (%s)"'
GIT_PS1_SHOWDIRTYSTATE=1       # staged '+', unstaged '*'
GIT_PS1_SHOWSTASHSTATE=1       # '$' something is stashed
GIT_PS1_SHOWUNTRACKEDFILES=1   # '%' untracked files
GIT_PS1_SHOWUPSTREAM="auto"    # '<' behind, '>' ahead, '<>' diverged, '=' no difference
GIT_PS1_DESCRIBE_STYLE=default # more info when in a detached HEAD
GIT_PS1_SHOWCOLORHINTS=1       # Display colours in PROMPT_COMMAND

# Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# Local customized path and environment settings, etc.
if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi

# Golang
export PATH=$PATH:$(go env GOPATH)/bin

# Add dotfiles bin to PATH
export PATH="$HOME/.bin:$PATH"

# ===========================================================#
#
# Personal $HOME/.bashrc
# using bash-5.0
#
# By Dylan Pinn
#
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
# ~/pwd (git-branch) $
# TODO: Make this work with just PS1.
PROMPT_COMMAND='__git_ps1 "\w" " \\\$ "'
PS1="\\w\$(__git_ps1 '(%s)') \$ "

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

#!/bin/zsh

zmodload zsh/zprof

# source all .zsh files inside of the zsh/ directory
# for config ($ZSH/**/*.zsh) source $config

# # Homebrew autocomplete
# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

#   autoload -Uz compinit
#   compinit
# fi

# # Initialise autocomplete
# autoload -U compinit add-zsh-hook
# compinit

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Search through history with up & down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# Back and forward through words with alt <- & alt ->
if [[ `uname` == 'Darwin' ]]; then
  bindkey "^[^[[C" forward-word
  bindkey "^[^[[D" backward-word
elif [[ `uname` == 'Linux' ]]; then
  bindkey "^[[1;3C" forward-word
  bindkey "^[[1;3D" backward-word
fi

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Stop wget from creating ~/.wget-hsts file. I don't care about HSTS (HTTP
# Strict Transport Security) for wget; it's not as if I'm logging into my bank
# with it.
alias wget='wget --no-hsts'

# Colorize terminal
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
if [[ `uname` == 'Darwin' ]]; then
  alias ls='ls -G'
  alias ll='ls -lG'
elif [[ `uname` == 'Linux' ]]; then
  alias ls='ls --color'
  alias ll='ls -l --color'
fi

alias npm-global='npm list -g --depth=0'

# Dotfiles
alias dotfiles='cd ~/.dotfiles'

# Load completion menu styles last
# source $HOME/.zsh/styles.zsh

# FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Enable BG and Jobs
setopt monitor

# Display AWS Account if set
# function aws_account {
#   if [ -n "${AWS_ACCOUNT}" ]; then
#     echo -e "${RED}${BOLD}${AWS_ACCOUNT}:${AWS_ROLE}${RESET}"
#   fi
# }
# PROMPT="%F{green}$(aws_account)"$PROMPT
# export PATH="/usr/local/sbin:$PATH"

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr 'M'
zstyle ':vcs_info:*' unstagedstr 'M'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
  '%F{5}[%F{2}%b%F{5}] %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
    hook_com[unstaged]+='%F{1}??%f'
  fi
}

precmd () { vcs_info }
PROMPT='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_} %f%# '

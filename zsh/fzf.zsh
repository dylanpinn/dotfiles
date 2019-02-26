#!/bin/zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Integrate FZF with bat
alias preview="fzf --preview 'bat --color \"always\" {}'"

#!/usr/bin/env sh
#
# Setup project using tmux.
#

set -e

if tmux has-session -t=dot 2> /dev/null; then
  tmux attach -t dot
  exit
fi

tmux new-session -d -s dot -n vim -x "$(tput cols)" -y "$(tput lines)"

# Main window: vim.
tmux send-keys -t dot:vim "nvim -c Ex" Enter

# General shell use.
tmux new-window -t dot -c "$PWD" -n dotfiles
tmux send-keys -t dot:dotfiles "git st" Enter

# Attach to tmux session
tmux attach -t dot

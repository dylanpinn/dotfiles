#!/bin/zsh

# eval "$(direnv hook zsh)"

direnv() {
  eval "$(command direnv hook zsh)"
  direnv "$@"
}

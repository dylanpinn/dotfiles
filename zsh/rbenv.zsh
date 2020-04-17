#!/bin/zsh

# eval "$(rbenv init -)"

rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

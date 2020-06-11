#!/usr/bin/env bash

set -e

shellcheck profile install.sh lint-shell.sh lint-vim.sh bash_completion \
  bash_profile bashrc

for bcfile in bash_completion.d/*; do
  [ -f "$bcfile" ] && shellcheck $bcfile
done
unset -v bcfile

for bash in bashrc.d/*.bash ; do
  [[ -e $bash ]] || continue
  shellcheck "$bash"
done
unset -v bash

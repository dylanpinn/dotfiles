#!/usr/bin/env bash

set -e

shellcheck -e SC1090 -s bash profile install.sh lint-shell.sh lint-vim.sh \
  bash_completion bash_profile bashrc

for bcfile in bash_completion.d/*; do
  [ -f "$bcfile" ] && shellcheck -e SC1090 -s bash "$bcfile"
done
unset -v bcfile

for bash in bashrc.d/*.bash ; do
  [[ -e $bash ]] || continue
  shellcheck -e SC1090 -s bash "$bash"
done
unset -v bash

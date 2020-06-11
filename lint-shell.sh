#!/usr/bin/env bash

set -e

shellcheck -e SC1090 profile install.sh lint-shell.sh lint-vim.sh \
  bash_completion bash_profile bashrc

for bcfile in bash_completion.d/*; do
  [ -f "$bcfile" ] && shellcheck -e SC1090 "$bcfile"
done
unset -v bcfile

for bash in bashrc.d/*.bash ; do
  [[ -e $bash ]] || continue
  shellcheck -e SC1090 "$bash"
done
unset -v bash

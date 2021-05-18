#!/usr/bin/env bash

# Load ~/.profile regardless of shell version
if [ -e "$HOME"/.profile ]; then
  # shellcheck source=/dev/null
  . "$HOME"/.profile
fi

# Load any supplementary scripts in ~/.bash_profile.d; it need not exist
for bash in "$HOME"/.bash_profile.d/*.bash; do
  [ -e "$bash" ] || continue
  # shellcheck source=/dev/null
  . "$bash"
done
unset -v bash

# If ~/.bashrc exists, source that too; the tests for both interactivity and
# minimum version numbers are in there
if [ -f "$HOME"/.bashrc ]; then
  # shellcheck source=/dev/null
  . "$HOME"/.bashrc
fi

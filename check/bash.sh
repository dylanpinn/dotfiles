#!/usr/bin/env bash
#
# Check syntax for bash files.

for bash in bash/* */bashrc.d/* ; do
  [ -f "$bash" ] || continue
  bash -n "$bash" || exit
done

printf 'All bash(1) scripts parsed successfully.\n'

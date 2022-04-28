#!/usr/bin/env sh
#
# Check syntax for sh files.

for sh in sh/* */profile.d/*; do
  [ -f "$sh" ] || continue
  sh -n -- "$sh"
done

printf 'POSIX shell scripts parsed successfully.\n'

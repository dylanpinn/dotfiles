#!/usr/bin/env sh
#
# Lint shell files.

set -e

set \
  sh/profile \
  */profile.d/*.sh

shellcheck -e SC1090 -s sh -- "$@"

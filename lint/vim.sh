#!/usr/bin/env sh
#
# Lint vim files using vint.

set -eu

find vim -type f -exec vint {} +

#!/usr/bin/env sh
#
# Lint vim files using vint.

set -eou pipefail

find vim -type f -exec vint {} +

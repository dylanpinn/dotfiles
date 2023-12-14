#!/usr/bin/env sh
#
# Lint shell files with shellcheck.

set -eu

shellcheck --shell=sh sh/profile

find . \
    -name "*.sh" \
    -not -path "./nvim/pack/bundle/*" \
    -exec shellcheck --shell=sh {} +

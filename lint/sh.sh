#!/usr/bin/env sh
#
# Lint shell files with shellcheck.

set -eu

shellcheck --shell=sh sh/profile

find . -name "*.sh" -exec shellcheck --shell=sh {} +

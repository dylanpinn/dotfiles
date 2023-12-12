#!/usr/bin/env sh
#
# Lint bash files with shellcheck.

set -eou pipefail

shellcheck --shell=bash bash/bash_profile
shellcheck --shell=bash bash/bashrc

find . -name "*.bash" -exec shellcheck --shell=bash {} +

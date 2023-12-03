#!/usr/bin/env sh
#
# Format Lua files.

set -eou pipefail

stylua .luacheckrc home/

#!/usr/bin/env sh
#
# Lint shell files with shellcheck.

set -eu

shellcheck --shell=sh sh/profile

find . \
    -name "*.sh" \
    -not -path "./nvim/pack/bundle/*" \
    -not -path "*/profile.d/*" \
    -exec shellcheck {} +

# Scripts in the `profile.d` directory are sourced by the shell, so they don't
# have a shebang. We need to tell shellcheck to treat them as POSIX shell.
find . \
    -name "*/profile.d/*.sh" \
    -not -path "./nvim/pack/bundle/*" \
    -exec shellcheck --shell=sh {} +

#!/usr/bin/env sh
#
# Remove merged local branches in a Git repo.
#

set -eou pipefail

git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D "$branch"; done

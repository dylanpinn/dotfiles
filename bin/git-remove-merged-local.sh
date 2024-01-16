#!/usr/bin/env sh
#
# Remove merged local branches in a Git repo.
#

set -eou pipefail

main() {
    update_repo
    for branch in $(branches); do
        delete_branch
    done
}

update_repo() {
    git fetch --prune
}

branches() {
    git branch -vv |
        grep ': gone]' |
        awk '{print $1}'
}

delete_branch() {
    git branch -D "$branch"
}

main

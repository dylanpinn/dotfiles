#!/usr/bin/env sh
#
# Run eslint on changed files in the Git repo compared to main|master branch.

set -e

main_branch() {
    if git show-ref --verify --quiet refs/heads/main; then
        echo main
    else
        echo master
    fi
}

changed_files() {
    git diff --name-only --diff-filter=d "$(main_branch)"...HEAD

}

main() {
    # Word splitting is intentional here: changed_files returns a list of filenames
    # that need to be passed as separate arguments to eslint, not as a single string.
    # shellcheck disable=SC2046
    npx eslint --no-warn-ignored $(changed_files)
}

main

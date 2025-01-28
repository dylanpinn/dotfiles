#!/usr/bin/env bash

# Label: Git Lint Check
# Description: Enforce consistent Git commits.
git_lint_check() {
  if _check_gem_dependencies "git-lint"; then
    git-lint --hook "${BASH_ARGV[0]}"
  fi
}
export -f git_lint_check

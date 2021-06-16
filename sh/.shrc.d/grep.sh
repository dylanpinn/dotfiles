#!/bin/sh

# Define function proper
grep() {
  # Add --binary-files=without-match to gracefully skip binary files.
  set -- --binary-files=without-match "$@"

  # Add --color=auto.
  set -- --color=auto "$@"

  # Add --exclude-dir to ignore version control dot-directories.
  set -- \
    --exclude-dir=.git \
    "$@"

  # Run grep(1) with the concluded arguments.
  command grep "$@"
}

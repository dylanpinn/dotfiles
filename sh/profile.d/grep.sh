#######################################
# Override grep with some sensible defaults.
#######################################
grep() {
    # Add --binary-files=without-match to gracefully skip binary files.
    set -- --binary-files=without-match "$@"

    # Add --color=auto.
    set -- --color=auto "$@"

    # Add --exclude to ignore JavaScript source map files.
    set -- --exclude \
        --exclude=*.map.js \
        "$@"

    # Add --exclude-dir to ignore version control dot-directories.
    set -- \
        --exclude-dir=.git \
        "$@"

    # Add --exclude-dir to ignore dependency directories (might need to remove
    # this if needing to search through dependency directories).
    set -- \
        --exclude-dir=node_modules \
        "$@"

    # Run grep(1) with the concluded arguments.
    command grep "$@"
}

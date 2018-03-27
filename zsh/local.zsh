#!/bin/zsh

# Check if we can read given files and source those we can.
xsource() {
    if (( ${#argv} < 1 )) ; then
        printf 'usage: xsource FILE(s)...\n' >&2
        return 1
    fi

    while (( ${#argv} > 0 )) ; do
        [[ -r "$1" ]] && source "$1"
        shift
    done
    return 0
}

zrclocal() {
    xsource "/etc/zsh/zshrc.local"
    xsource "${HOME}/.zshrc.local"
    return 0
}

zrclocal

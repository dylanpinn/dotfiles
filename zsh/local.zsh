#!/bin/zsh

zrclocal() {
    xsource "/etc/zsh/zshrc.local"
    xsource "${HOME}/.zshrc.local"
    return 0
}

zrclocal

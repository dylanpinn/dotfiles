#!/bin/sh

# only source zplug on initial load
if [ -z ${RELOAD} ]; then
  if ! [ type "zplug" > /dev/null 2>&1 ]; then
    source ~/.zplug/init.zsh
  fi

  zplug "zplug/zplug", hook-build:"zplug --self-manage"

  # Extra functionality
  zplug "zsh-users/zsh-syntax-highlighting", defer:2
  zplug "zsh-users/zsh-history-substring-search", defer:3
  zplug "zsh-users/zsh-autosuggestions"

  # Prompt
  zplug "mafredri/zsh-async", from:github
  zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

  # nvm and npm
  # export NVM_LAZY_LOAD=true
  export NVM_AUTO_USE=true
  zplug "lukechilds/zsh-nvm"
  zplug "lukechilds/zsh-better-npm-completion", defer:2

  # zplug "erikced/zsh-pyenv-lazy-load"

  zplug "plugins/colored-man-pages", from:oh-my-zsh
  zplug "caarlos0/ports", lazy:true

  # Install plugins if there are plugins that have not been installed
  if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  zplug load
fi

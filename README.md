# .dotfiles

My dotfiles, managed with `make`.

## Setup

Ensure that SSH keys have been setup on system, I use 1Password for this, and I
typically install 1Password through Homebrew Cask, so that is a requirement.
Follow instructions at [brew.sh](https://brew.sh).

Clone dotfiles repo into a location such as `~/.dotfiles`.

```sh
git clone git@github.com:dylanpinn/dotfiles.git ~/.dotfiles
```

Set initial email address by using EMAIL="email@domain.com" make.

Check output of `make -n install` and `make diff`.

Run `make install` to install.`

Need to setup `.rtx.local.toml` to include the correct `PROFILE`.

## Components

## shell configuration

### sh

### bash

### zsh

### tmux

### vim

### git

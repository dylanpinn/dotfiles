# Dotfiles

This contains my dotfiles that should work across multiple machines and
operating systems.

## Requirements

- `make`

### macOS

- [`brew`](https://brew.sh)

## Installation

```sh
make install
```

## Configuration

### Per host configuration

You can configure extra Makefile targets and variable overrides by placing them
in `$XDG_CONFIG_HOME/dotfiles/config` and running `make install-conf`.

### Shell

Bash is my currently my preferred shell, however, most of the configuration
should be able to work in other shells with minimal work.  The `~/.profile`
contains most shell agnostic configuration.

Extra configuration is loaded from the `~/.profile.d` directory, this allows
setting application or host specific config.

#### Bash

Bash loads the `~/.bash_profile`, which is responsible for loading the generic
configuration (`~/.profile`) and bash specific configuration (`~/.bashrc`).

Extra configuration is loaded from the `~/.bashrc.d` directory, this allows
setting application or host specific config.

### AWS

This just moves the `awscli` configuration out of the `$HOME` directory.

### Git

This sets some sensible defaults. The configuration is generated using a `m4`
template and the name and email are added via the `Makefile`.

### Homebrew

Most applications either CLI or GUI are managed using Homebrew bundle.  The
`Brewfile` is a manifest of the installed applications.

### PostgresSQL

Sets some sensible defaults for the `psql` CLI.  This moves the CLI
configuration out of `$HOME`.

### Vim

This is my preferred editor.  The aim is to use as close to vanilla vim as
possible to ensure compatability with as many instances of vim as possible.

## Linting and checking

Checks are run on some of the files before installing and linting can be run
manually with `make lint`.  This is also run in CI using GitHub Actions.

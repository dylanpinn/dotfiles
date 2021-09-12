# Dotfiles

This contains my dotfiles that should work across multiple machines and
operating systems.

## Requirements

- `make`
- [`brew`](https://brew.sh)

## Installation

```sh
make install
```

## Configuration

### Shell

Bash is my currently my preferred shell, however, most of the configuration
should be able to work in other shells with minimal work.  The `~/.profile`
contains most shell agnostic configuration.

#### Bash

Bash loads the `~/.bash_profile`, which is responsible for loading the generic
configuration (`~/.profile`) and bash specific configuration (`~/.bashrc`).

### Homebrew

Most applications either CLI or GUI are managed using Homebrew bundle.  The
`Brewfile` is a manifest of the installed applications.

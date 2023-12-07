# Dotfiles

This contains my dotfiles, configured using `chezmoi`. It currently works for my
personal and work devices (macOS).

## Requirements

To setup this on a new machine, the following tools are required:

- `make`, installed by default on modern macOS.
- [`brew`](https://brew.sh), "The Missing Package Manager for macOS (or Linux)".
- `chezmoi` (`brew install chezmoi`), "Manage your dotfiles across multiple
  diverse machines, securely."

## Installation / Apply Updates

First step to get this setup on new machine is to clone the repo down into a,
directory such as `~/.dotfiles`.

To install the dotfiles or apply changes run `make` with no arguments from the
project root. This will linters of the files and then run `chezmoi apply -v` to
apply updates.

## Configuration

Because `chezmoi` mirrors the destination and uses a unique naming convention
for hidden and private files it can be a little bit difficult to find the
configuration. All of the configuration resides in `home` directory.

### Shell

Bash is my currently my preferred shell, however, most of the configuration
should be able to work in other shells with minimal work. The `~/.profile`
contains most shell agnostic configuration.

Extra configuration is loaded from the `~/.profile.d` directory, this allows
setting application or host specific config.

Configuration:

- `~/.profile` -> `./home/dot_profile`
- `~/.profile.d/` -> `./home/dot_profile.d/`

#### Bash

Bash loads the `~/.bash_profile`, which is responsible for loading the generic
configuration (`~/.profile`) and bash specific configuration (`~/.bashrc`).

Extra configuration is loaded from the `~/.bashrc.d` directory, this allows
setting application or host specific config.

Configuration:

- `~/.bash_profile` -> `./home/dot_bash_profile`
- `~/.bashrc` -> `./home/dot_bashrc`
- `~/.bashrc.d/` -> `./home/dot_bashrc.d/`

### AWS

This just moves the `awscli` configuration out of the `$HOME` directory.

### Git

This sets some sensible defaults. Per device configuration is handled by
`chezmoi`. See
[docs](https://www.chezmoi.io/user-guide/manage-machine-to-machine-differences/)
for how this is done.

Configuration:

- `~/.config/git/config` -> `./home/private_dot_config/git/config.tmpl`

### Homebrew

Most applications either CLI or GUI are managed using Homebrew bundle. The
`Brewfile` is a manifest of the installed applications. This is split up into
separate files for either work or personal profiles. `chezmoi` is able to handle
this and will re-create the manifest file when needed and apply updates when it
has changed.

Configuration:

- `~/.Brewfile` -> `./home/dot_Brewfile.tmpl`

### Neovim

I have migrated over to use Neovim as my main editor. The main reason for
picking this over Vim, is the in-built LSP client and Treesitter support. My
goal is to use vanilla Neovim as much as possible and only use a plugin when a
native solution isn't present.

Configuration:

- `~/.config/nvim/` -> `./home/private_dot_config/nvim/`

### Vim

The aim is to use as close to vanilla vim as possible to ensure compatibility
with as many instances of vim as possible.

Configuration:

- `~/.vim/` -> `./home/dot_vim/`

## Linting and checking

Checks are run on some of the files before installing and linting can be run
manually with `make lint`. This is also run in CI using GitHub Actions.

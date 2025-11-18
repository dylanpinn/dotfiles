# .dotfiles

A comprehensive personal dotfiles repository for managing development tool and shell environment configurations. Built and installed with `make`, with support for multiple shells, editors, and a rich ecosystem of development tools.

## Quick Start

Clone the repository and install configurations:

```bash
git clone https://github.com/yourusername/.dotfiles ~/.dotfiles
cd ~/.dotfiles
make install
```

Or install specific components:

```bash
make install-bash      # Bash configuration
make install-nvim      # Neovim configuration
make install-vim       # Vim configuration
make install-tmux      # Tmux configuration
make install-git       # Generate and install Git config
make install-sh        # POSIX shell profile
```

## Features

- **Shell Environments**: Bash and POSIX shell with modular profile configurations
- **Editors**: Neovim (Lua-based with LSP support) and Vim
- **Terminal**: Tmux with custom bindings and plugins
- **Version Control**: Git with M4 templating for user-specific variables
- **Development Tools**: Pre-configured ESLint, ShellCheck, Stylua, Luacheck, Prettier, and Vint
- **Package Management**: Homebrew, npm, and Mise integration
- **Additional Tools**: Ghostty terminal and Jujutsu version control support
- **Utilities**: Custom shell scripts for common Git and development workflows
- **XDG Compliance**: Respects XDG Base Directory Specification for clean home directory

## Installation & Setup

### Full Installation

Install all configurations:

```bash
make install
```

This installs Bash, shell profiles, Git configuration, Neovim, Vim, Tmux, custom utilities, and more.

### Selective Installation

Choose specific components:

```bash
make install-bash      # Install Bash configuration
make install-nvim      # Install Neovim configuration
make install-vim       # Install Vim configuration
make install-tmux      # Install Tmux configuration
make install-git       # Generate and install Git config from template
make install-sh        # Install POSIX shell profile
make install-bin       # Install custom utility scripts
make install-brew      # Install Homebrew packages
make install-ghostty   # Install Ghostty terminal config
make install-jj        # Install Jujutsu version control config
make install-mise      # Install Mise tool version manager
```

## Development Workflow

### Linting & Validation

```bash
make lint              # Run all linters
make lint-bash         # Lint Bash files with ShellCheck
make lint-sh           # Lint shell scripts with ShellCheck
make lint-lua          # Lint Lua files with Luacheck
make lint-vim          # Lint Vim configuration with Vint
```

### Code Formatting

```bash
make format            # Format all supported file types
make format-bash       # Format Bash scripts
make format-sh         # Format shell scripts
make format-lua        # Format Lua files
make format-prettier   # Format JSON, YAML, Markdown, etc.
```

### Quality Checks

```bash
make check             # Run all checks
make check-lua         # Check Lua formatting with Stylua
make check-prettier    # Check code formatting with Prettier
```

### Git Configuration

Generate a Git configuration from the M4 template:

```bash
make git/config
```

Or with custom variables:

```bash
make git/config NAME="Your Name" EMAIL="your@email.com" SIGNING_KEY="YOUR_KEY_ID"
```

## Directory Structure

```
.
├── bash/              # Bash profile and bashrc with modular configuration
├── bin/               # Custom shell utility scripts
├── check/             # Validation scripts
├── format/            # Code formatting scripts
├── git/               # Git configuration and hooks
├── ghostty/           # Ghostty terminal configuration
├── homebrew/          # Homebrew Brewfile
├── jj/                # Jujutsu version control config
├── lint/              # Linting scripts
├── mise/              # Mise tool version manager config
├── npm/               # NPM configuration
├── nvim/              # Neovim configuration (Lua-based)
├── sh/                # POSIX shell profile and config
├── tmux/              # Tmux configuration
├── vim/               # Vim configuration
├── work/              # Work-specific shell configurations
└── zed/               # Zed editor configuration
```

## Configuration Highlights

### Neovim

- Entry point: `nvim/init.lua`
- Modular Lua configuration in `nvim/lua/dcp/`
- Treesitter for syntax highlighting
- LSP support with language servers
- Compiler configurations for ESLint, Luacheck, Rubocop, and Vint

### Git

- M4 template-based configuration for user-specific values
- Custom git hooks for automation
- Global git ignore rules

### Custom Utilities

Located in `bin/`:

- **eslint-changed**: Run ESLint on files changed relative to main/master branch
- **git-remove-merged-local**: Clean up local branches that have been merged
- **git-stats-loc**: Show line-of-code statistics for commits

### Tool Integration

All tools are pre-configured and ready to use:

- **ShellCheck** (`.shellcheckrc`): Shell script linting
- **Stylua** (`.stylua.toml`): Lua formatting
- **Luacheck** (`.luacheckrc`): Lua code checking
- **Prettier** (`.prettierrc.toml`): JSON, YAML, Markdown formatting
- **Vint** (`.vintrc.yaml`): Vim script linting

## Requirements

- **Make**: Build system
- **Git**: Version control
- **Node.js/npm**: For JavaScript tooling
- **M4**: Preprocessor (for Git config generation)
- **ShellCheck**: Shell script linter
- **Stylua**: Lua formatter
- **Luacheck**: Lua linter
- **Prettier**: Code formatter
- **Neovim/Vim**: Text editors
- **Tmux**: Terminal multiplexer

Optional but recommended:

- **Homebrew**: Package manager
- **Mise**: Tool version manager
- **Ghostty**: Modern terminal emulator
- **Jujutsu**: Version control system

## Notes

- Repository uses `.POSIX:` for POSIX-compliant Makefile behavior
- Most scripts follow strict error handling with `set -eu`
- Modular approach keeps configuration organized and maintainable
- Full XDG Base Directory Specification compliance

## See Also

- [CLAUDE.md](./CLAUDE.md) - Detailed documentation for developers
- [LICENSE.md](./LICENSE.md) - License information

# Ideas

## TODO:

- [ ] Vim (basic editing)
- [ ] Neovim (LSP enhanced editing)
- [ ] Bash (Do I want to look into Fish or Zsh instead?)
- [ ] tmux
- [ ] Homebrew
- [ ] git

## NOTES:

How do I want to manage these files?
- Stow
- chezmoi
	- Not sure I like how it mangles the files and directory names.
- Something else?
- Something custom???

Where are some places of inspiration for how to do dotfiles?

- https://github.com/wincent/wincent
- https://dev.sanctum.geek.nz/cgit/dotfiles.git/about/

## Plan

Lets try to use Unix native tools as much as possible to handle this.

Lets try to use Make(1) as much as possible.

### Makefile

Can this be created with a ./configure script for each host?

make - compile files
make -n install - dry run
make install
make diff - create a diff of files that will be changed. Will make -n install do this?
make format
make lint
make check -- ???

standard make targets

```make
deps
build
install
default
all
```

Useful information about Make help (https://docs.cloudposse.com/reference/best-practices/make-best-practices/)


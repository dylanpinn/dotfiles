.POSIX:

.PHONY: all \
	check \
	check-lua \
	check-prettier \
	install \
	install-brew \
	install-git \
	install-sh \
	install-tmux \
	install-vim \
	install-work \
	lint \
	lint-bash \
	lint-sh \
	lint-vim

XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share
XDG_STATE_HOME ?= $(HOME)/.local/state

NAME ?= 'Dylan Pinn'

BINS = bin/git-remove-merged-local \
       bin/git-stats-loc

all: git/config \
	$(BINS)

check: check-lua \
	check-prettier

check-lua:
	sh check/lua.sh

check-prettier:
	npm run format:check

format: format-bash \
	format-lua \
	format-prettier \
	format-sh

format-bash:
	sh format/bash.sh

format-lua:
	sh format/lua.sh

format-prettier:
	npm run format

format-sh:
	sh format/sh.sh

git/config: git/config.m4
	m4 \
		--define=NAME=$(NAME) \
		--define=EMAIL="$(EMAIL)" \
		--define=SIGNING_KEY="$(SIGNING_KEY)" \
		git/config.m4 > $@

# TODO: not 100% sold on this target name.
dump-brew:
	brew bundle dump --force --describe --file=homebrew/$(PROFILE).Brewfile

install: install-bash \
	install-bin \
	install-git \
	install-mise \
	install-npm \
	install-nvim \
	install-tmux \
	install-vim

install-bash: lint-bash install-sh
	cp -p -- bash/bash_profile $(HOME)/.bash_profile
	cp -p -- bash/bashrc $(HOME)/.bashrc
	mkdir -p -- $(HOME)/.bashrc.d
	cp -p -- bash/bashrc.d/* $(HOME)/.bashrc.d/
	mkdir -p -- $(XDG_STATE_HOME)/bash

install-bin:
	mkdir -p $(HOME)/.local/bin
	cp -p -- $(BINS) $(HOME)/.local/bin/

install-git: git/config
	mkdir -p -- $(XDG_CONFIG_HOME)/git
	cp -p -- git/config $(XDG_CONFIG_HOME)/git/config
	cp -p -- git/ignore $(XDG_CONFIG_HOME)/git/ignore
	cp -pR -- git/hooks/ $(XDG_CONFIG_HOME)/git/hooks/

install-mise: install-bash
	cp -p -- mise/bashrc.d/* $(HOME)/.bashrc.d/

install-npm:
	mkdir -p -- $(XDG_CONFIG_HOME)/npm
	cp -pR -- npm/npmrc $(XDG_CONFIG_HOME)/npm/npmrc
	cp -p -- npm/profile.d/* $(HOME)/.profile.d/

install-nvim: lint-lua
	mkdir -p -- $(XDG_CONFIG_HOME)/nvim
	cp -pR -- nvim/ $(XDG_CONFIG_HOME)/nvim/

install-sh: lint-sh
	cp -p -- sh/profile $(HOME)/.profile
	mkdir -p -- $(HOME)/.profile.d/
	cp -p -- sh/profile.d/* $(HOME)/.profile.d/

install-tmux:
	mkdir -p -- $(XDG_CONFIG_HOME)/tmux
	cp -p -- tmux/tmux.conf $(XDG_CONFIG_HOME)/tmux/tmux.conf

VIMDIR = $(XDG_CONFIG_HOME)/vim

install-vim: lint-vim
	mkdir -p -- $(VIMDIR)
	mkdir -p -- $(XDG_STATE_HOME)/vim/{backup,swap,undo}
	cp -p -- vim/vimrc $(VIMDIR)/vimrc
	cp -pR -- vim/after \
		vim/autoload \
		vim/compiler \
		vim/ftdetect \
		vim/plugin \
		$(VIMDIR)

install-work: install-bash install-sh
	cp -p -- work/bashrc.d/* $(HOME)/.bashrc.d/
	cp -p -- work/profile.d/* $(HOME)/.profile.d/

# TODO: add this to the install target when it runs only when files have changed.
install-brew:
	cp -R -- homebrew/$(PROFILE).Brewfile $(HOME)/.Brewfile
	brew bundle --global --no-lock --verbose
	cp -p -- homebrew/profile.d/* $(HOME)/.profile.d/

lint: check\
	lint-bash \
	lint-lua \
	lint-sh \
	lint-vim

lint-bash:
	sh lint/bash.sh

lint-lua: check-lua
	sh lint/lua.sh

lint-sh:
	sh lint/sh.sh

lint-vim:
	sh lint/vim.sh

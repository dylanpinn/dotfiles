.POSIX:

.PHONY: all \
	install \
	install-brew \
	install-git \
	install-sh \
	install-tmux \
	install-vim

XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share

NAME ?= 'Dylan Pinn'
EMAIL ?= 'dylan.pinn@rea-group.com'
PROFILE ?= personal
SIGNING_KEY ?= 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMZnYed6OpvU4mkOvBu2V0wyxRQro4B2BPPYYUDq0CHr'

all: git/config

git/config: git/config.m4
	m4 \
		--define=NAME=$(NAME) \
		--define=EMAIL=$(EMAIL) \
		--define=SIGNING_KEY=$(SIGNING_KEY) \
		git/config.m4 > $@ # look into what this does

diff: diff-git \
	diff-sh \
	diff-tmux \
	diff-vim

# TODO: export COLORTERM in sh profile file.
diff-git: git/config
	export COLORTERM=256 && diff --color="auto" -- git/config $(XDG_CONFIG_HOME)/git/config

diff-sh:
	export COLORTERM=256 && diff --color="auto" -- sh/profile $(HOME)/.profile
	# TODO: How to diff ~/.profile.d/* directory.

diff-tmux:
	export COLORTERM=256 && diff --color="auto" -- tmux/tmux.conf $(XDG_CONFIG_HOME)/tmux/tmux.conf

diff-vim:
	export COLORTERM=256 && diff --color="auto" -- vim/vimrc $(HOME)/.vim/vimrc

# TODO: not 100% sold on this target name.
dump-brew:
	brew bundle dump --force --describe --file=homebrew/$(PROFILE).Brewfile

install: install-bash \
	install-git \
	install-tmux \
	install-vim

install-bash: install-sh
	cp -p -- bash/bash_profile $(HOME)/.bash_profile
	cp -p -- bash/bashrc $(HOME)/.bashrc

install-git: git/config
	mkdir -p -- $(XDG_CONFIG_HOME)/git
	cp -p -- git/config $(XDG_CONFIG_HOME)/git/config

install-sh: lint-sh
	cp -p -- sh/profile $(HOME)/.profile
	mkdir -p -- $(HOME)/.profile.d/
	cp -p -- sh/profile.d/* $(HOME)/.profile.d/

install-tmux:
	mkdir -p -- $(XDG_CONFIG_HOME)/tmux
	cp -p -- tmux/tmux.conf $(XDG_CONFIG_HOME)/tmux/tmux.conf

install-vim:
	mkdir -p -- $(HOME)/.vim
	cp -p -- vim/vimrc $(HOME)/.vim/vimrc

# TODO: add this to the install target when it runs only when files have changed.
install-brew:
	cp -R -- homebrew/$(PROFILE).Brewfile $(HOME)/.Brewfile
	brew bundle --global --no-lock --verbose
	cp -p -- homebrew/profile.d/* $(HOME)/.profile.d/

lint: lint-sh

lint-sh:
	sh lint/sh.sh

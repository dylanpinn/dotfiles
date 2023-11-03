.POSIX:

XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share
XDG_STATE_HOME ?= $(HOME)/.local/state

NAME ?= 'Dylan Pinn'

install: install-dotfiles

check-bash :
	sh check/bash.sh

check-sh :
	sh check/sh.sh

format: format-lua \
	format-sh

format-lua:
	sh format/lua.sh

format-sh:
	sh format/sh.sh

install-dotfiles: lint
	chezmoi apply -v

lint: lint-bash \
	lint-lua \
	lint-sh \
	lint-vim

lint-bash : check-bash
	sh lint/bash.sh

lint-lua:
	sh lint/lua.sh

lint-sh : check-sh
	sh lint/sh.sh

lint-vim :
	sh lint/vim.sh

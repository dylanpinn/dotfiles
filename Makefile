.POSIX:

XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share
XDG_STATE_HOME ?= $(HOME)/.local/state

install: install-dotfiles

check-bash:
	sh check/bash.sh

check-prettier:
	npm run format:check

check-sh:
	sh check/sh.sh

format: format-lua \
	format-prettier \
	format-sh

format-lua:
	sh format/lua.sh

format-prettier:
	npm run format

format-sh:
	sh format/sh.sh

install-dotfiles: lint
	chezmoi apply -v

lint: check-prettier \
	lint-bash \
	lint-lua \
	lint-sh \
	lint-vim

lint-bash: check-bash
	sh lint/bash.sh

lint-lua:
	sh lint/lua.sh

lint-sh: check-sh
	sh lint/sh.sh

lint-vim:
	sh lint/vim.sh

.POSIX:

XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share
XDG_STATE_HOME ?= $(HOME)/.local/state

NAME ?= 'Dylan Pinn'

.PHONY: all
all: install

.PHONY: install
install: install-sh

.PHONY: install-sh
install-sh: uninstall-sh
	mkdir -p -- $(HOME)/.profile.d
	ln -s -- $(PWD)/sh/profile $(HOME)/.profile
	ln -s -- $(PWD)/sh/profile.d/* $(HOME)/.profile.d/

.PHONY: uninstall-sh
uninstall-sh:
	rm -f -- $(HOME)/.profile
	rm -rf -- $(HOME)/.profile.d

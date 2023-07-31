.POSIX:

XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share
XDG_STATE_HOME ?= $(HOME)/.local/state

NAME ?= 'Dylan Pinn'

BINS = bin/git-remove-merged-local \
       bin/git-stats-loc

all: $(BINS) \
	git/config

git/config: git/config.m4
	m4 \
		-D NAME=$(NAME) \
		git/config.m4 > $@

install: install-bash \
	install-bin \
	install-git \
	install-vim

brew-dump :
	(cd homebrew; brew bundle dump --force --describe)

check-bash :
	sh check/bash.sh

check-sh :
	sh check/sh.sh

clean:
	rm -r -- \
		$(BINS) \
		git/config

clean-bash :
	rm -f -- $(HOME)/.bashrc
	rm -f -- $(HOME)/.bash_profile
	rm -rf -- $(HOME)/.bashrc.d

clean-bin:
	rm -rf -- $(HOME)/.local/bin

clean-emacs :
	rm -f -- $(XDG_CONFIG_HOME)/emacs/init.el

clean-postgres :
	rm -f -- $(XDG_CONFIG_HOME)/pg/psqlrc

clean-sh :
	rm -f -- $(HOME)/.profile
	rm -rf -- $(HOME)/.profile.d

clean-tmux:
	rm -rf -- $(XDG_CONFIG_HOME)/tmux

format: format-lua \
	format-sh

format-lua:
	sh format/lua.sh

format-sh:
	sh format/sh.sh

install-alacritty:
	ln -sf -- $(PWD)/alacritty $(XDG_CONFIG_HOME)/alacritty

install-asdf: install-bash
	install -- $(PWD)/asdf/bashrc.d/* $(HOME)/.bashrc.d/
	install -- $(PWD)/asdf/profile.d/* $(HOME)/.profile.d/
	install -- $(PWD)/asdf/asdfrc $(XDG_CONFIG_HOME)/asdfrc

install-aws : install-sh
	ln -s -- $(PWD)/aws/profile.d/* $(HOME)/.profile.d/

install-bash : check-bash clean-bash install-sh
	mkdir -p -- $(HOME)/.bashrc.d
	mkdir -p -- $(XDG_STATE_HOME)/bash
	ln -s -- $(PWD)/bash/bashrc $(HOME)/.bashrc
	ln -s -- $(PWD)/bash/bash_profile $(HOME)/.bash_profile
	ln -s -- $(PWD)/bash/bashrc.d/* $(HOME)/.bashrc.d/

install-bin: $(BINS) clean-bin
	mkdir -p -- $(HOME)/.local/bin
	install -- $(BINS) $(HOME)/.local/bin/

install-brew:
	brew update
	(cd homebrew; brew bundle)

install-conf:
	sh install/conf.sh

install-emacs : clean-emacs
	mkdir -p -- $(XDG_CONFIG_HOME)/emacs
	touch -- $(XDG_CONFIG_HOME)/emacs/custom.el
	ln -s -- $(PWD)/emacs/init.el $(XDG_CONFIG_HOME)/emacs/init.el

install-git : git/config
	mkdir -p -- $(XDG_CONFIG_HOME)/git
	ln -s -- $(PWD)/git/bashrc.d/* $(HOME)/.bashrc.d/

install-nix:
	mkdir -p -- $(XDG_CONFIG_HOME)/nix
	mkdir -p -- $(XDG_CONFIG_HOME)/home-manager
	stow --verbose --target=$(XDG_CONFIG_HOME)/nix --restow nix
	stow --verbose --target=$(XDG_CONFIG_HOME)/home-manager --restow home-manager

install-nvim: install-alacritty
	sh install/nvim.sh
	mkdir -p -- $(XDG_CONFIG_HOME)/nvim
	stow --verbose --target=$(XDG_CONFIG_HOME)/nvim --restow nvim

install-personal : install-sh
	ln -s -- $(PWD)/personal/profile.d/* $(HOME)/.profile.d/

install-postgres : clean-postgres install-sh
	mkdir -p -- $(XDG_CONFIG_HOME)/pg
	ln -s -- $(PWD)/postgres/psqlrc $(XDG_CONFIG_HOME)/pg/psqlrc
	ln -s -- $(PWD)/postgres/profile.d/* $(HOME)/.profile.d/

install-sh : check-sh clean-sh
	mkdir -p -- $(HOME)/.profile.d
	ln -s -- $(PWD)/sh/profile $(HOME)/.profile
	ln -s -- $(PWD)/sh/profile.d/* $(HOME)/.profile.d/

install-tmux: clean-tmux
	mkdir -p -- $(XDG_CONFIG_HOME)/tmux
	ln -s -- $(PWD)/tmux/tmux.conf $(XDG_CONFIG_HOME)/tmux/tmux.conf

install-vim:
	mkdir -p -- $(HOME)/.vim
	mkdir -p -- $(XDG_CACHE_HOME)/vim/{backup,swap,undo}
	sh install/vim.sh
	stow --verbose --target=$$HOME/.vim --restow vim

install-work : install-sh
	ln -s -- $(PWD)/work/profile.d/* $(HOME)/.profile.d/
	ln -s -- $(PWD)/work/bashrc.d/* $(HOME)/.bashrc.d/

install-yabai:
	stow --verbose --target=$(XDG_CONFIG_HOME)/yabai --restow yabai
	stow --verbose --target=$(XDG_CONFIG_HOME)/skhd --restow skhd

lint: lint-bash \
	lint-lua \
	lint-sh \
	lint-vim \
	lint-yaml

lint-bash : check-bash
	sh lint/bash.sh

lint-lua:
	sh lint/lua.sh

lint-sh : check-sh
	sh lint/sh.sh

lint-vim :
	sh lint/vim.sh

lint-yaml:
	sh lint/yaml.sh

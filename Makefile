.POSIX:

.PHONY: all \
		install \
		install-git

XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share

NAME ?= 'Dylan Pinn'
EMAIL ?= 'dylan.pinn@rea-group.com'
SIGNING_KEY ?= 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMZnYed6OpvU4mkOvBu2V0wyxRQro4B2BPPYYUDq0CHr'

all: git/config

git/config: git/config.m4
	m4 \
		   --define=NAME=$(NAME) \
		   --define=EMAIL=$(EMAIL) \
		   --define=SIGNING_KEY=$(SIGNING_KEY) \
		   git/config.m4 > $@ # look into what this does

diff: diff-git \
	diff-tmux \
	diff-vim

# export COLORTERM in sh profile file.
diff-git: git/config
	export COLORTERM=256 && diff --color="auto" -- git/config $(XDG_CONFIG_HOME)/git/config

diff-tmux:
	export COLORTERM=256 && diff --color="auto" -- tmux/tmux.conf $(XDG_CONFIG_HOME)/tmux/tmux.conf

diff-vim:
	export COLORTERM=256 && diff --color="auto" -- vim/vimrc $(HOME)/.vim/vimrc

install: install-git \
	install-tmux \
	install-vim

install-git: git/config
	mkdir -p -- $(XDG_CONFIG_HOME)/git
	cp -p -- git/config $(XDG_CONFIG_HOME)/git/config

install-tmux:
	mkdir -p -- $(XDG_CONFIG_HOME)/tmux
	cp -p -- tmux/tmux.conf $(XDG_CONFIG_HOME)/tmux/tmux.conf

install-vim:
	mkdir -p -- $(HOME)/.vim
	cp -p -- vim/vimrc $(HOME)/.vim/vimrc

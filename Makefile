.POSIX:

.PHONY: all \
		install \
		install-git

XDG_CACHE_HOME = $(HOME)/.cache
XDG_CONFIG_HOME = $(HOME)/.config
XDG_DATA_HOME = $(HOME)/.local/share

NAME = 'Dylan Pinn'
EMAIL = 'dylan.pinn@rea-group.com'
SIGNING_KEY = 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMZnYed6OpvU4mkOvBu2V0wyxRQro4B2BPPYYUDq0CHr'

.SUFFIXES:
.SUFFIXES: .awk .bash .m4 .mi5 .pl .sed .sh

all: git/config

git/config: git/config.m4
	m4 \
		   --define=NAME=$(NAME) \
		   --define=EMAIL=$(EMAIL) \
		   --define=SIGNING_KEY=$(SIGNING_KEY) \
		   git/config.m4 > $@ # look into what this does

install: install-git

install-git: git/config
	mkdir -p -- $(XDG_CONFIG_HOME)/git
	cp -p -- git/config $(XDG_CONFIG_HOME)/git/config

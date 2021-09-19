XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share
XDG_STATE_HOME ?= $(HOME)/.local/state

NAME ?= 'Dylan Pinn'
EMAIL ?= 'me@dylanpinn.com'

install : install-bash \
	install-emacs \
	install-git \
	install-nvm \
	install-vim \
	install-wakatime

brew-dump :
	(cd homebrew; brew bundle dump --force --describe)

check-bash :
	sh check/bash.sh

check-sh :
	sh check/sh.sh

clean-bash :
	rm -f -- $(HOME)/.bashrc
	rm -f -- $(HOME)/.bash_profile
	rm -rf -- $(HOME)/.bashrc.d

clean-emacs :
	rm -f -- $(XDG_CONFIG_HOME)/emacs/init.el

clean-git :
	rm -f -- $(XDG_CONFIG_HOME)/git/config

clean-postgres :
	rm -f -- $(XDG_CONFIG_HOME)/pg/psqlrc

clean-sh :
	rm -f -- $(HOME)/.profile
	rm -rf -- $(HOME)/.profile.d

clean-vim :
	rm -f -- $(HOME)/.vim/filetype.vim
	rm -f -- $(HOME)/.vim/vimrc
	rm -f -- $(HOME)/.vim/after
	rm -f -- $(HOME)/.vim/compiler
	rm -f -- $(HOME)/.vim/plugin

git/config: git/config.m4
	m4 \
		-D NAME=$(NAME) \
		-D EMAIL=$(EMAIL) \
		git/config.m4 > $@

install-aws : install-sh
	ln -s -- $(PWD)/aws/profile.d/* $(HOME)/.profile.d/

install-bash : check-bash clean-bash install-sh
	mkdir -p -- $(HOME)/.bashrc.d
	mkdir -p -- $(XDG_STATE_HOME)/bash
	ln -s -- $(PWD)/bash/bashrc $(HOME)/.bashrc
	ln -s -- $(PWD)/bash/bash_logout $(HOME)/.bash_logout
	ln -s -- $(PWD)/bash/bash_profile $(HOME)/.bash_profile
	ln -s -- $(PWD)/bash/bashrc.d/* $(HOME)/.bashrc.d/

install-brew :
	brew update
	(cd homebrew; brew bundle)

install-conf :
	sh install/conf.sh

install-emacs : clean-emacs
	mkdir -p -- $(XDG_CONFIG_HOME)/emacs
	touch -- $(XDG_CONFIG_HOME)/emacs/custom.el
	ln -s -- $(PWD)/emacs/init.el $(XDG_CONFIG_HOME)/emacs/init.el

install-git : git/config clean-git install-bash
	mkdir -p -- $(XDG_CONFIG_HOME)/git
	ln -s -- $(PWD)/git/config $(XDG_CONFIG_HOME)/git/config
	ln -s -- $(PWD)/git/bashrc.d/* $(HOME)/.bashrc.d/

install-nvm : install-bash
	sh install/nvm.sh
	ln -s -- $(PWD)/nvm/profile.d/* $(HOME)/.profile.d/
	ln -s -- $(PWD)/nvm/bashrc.d/* $(HOME)/.bashrc.d/

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

install-vim : clean-vim
	mkdir -p -- $(HOME)/.vim
	mkdir -p -- $(XDG_CACHE_HOME)/vim/{backup,swap,undo}
	sh install/vim.sh
	ln -s -- $(PWD)/vim/filetype.vim $(HOME)/.vim/filetype.vim
	ln -s -- $(PWD)/vim/vimrc $(HOME)/.vim/vimrc
	ln -s -- $(PWD)/vim/after $(HOME)/.vim/after
	ln -s -- $(PWD)/vim/compiler $(HOME)/.vim/compiler
	ln -s -- $(PWD)/vim/plugin $(HOME)/.vim/plugin

install-wakatime :
	ln -s -- $(PWD)/wakatime/profile.d/* $(HOME)/.profile.d/

install-work : install-sh
	ln -s -- $(PWD)/work/profile.d/* $(HOME)/.profile.d/
	ln -s -- $(PWD)/work/bashrc.d/* $(HOME)/.bashrc.d/

lint : lint-bash \
	lint-sh \
	lint-vim

lint-bash : check-bash
	sh lint/bash.sh

lint-sh : check-sh
	sh lint/sh.sh

lint-vim :
	sh lint/vim.sh

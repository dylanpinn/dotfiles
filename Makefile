XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share

NAME ?= 'Dylan Pinn'
EMAIL ?= 'me@dylanpinn.com'

install : install-bash \
	install-git \
	install-nvm \
	install-vim

brew-dump :
	(cd homebrew; brew bundle dump --force --describe)

git/config: git/config.m4
	m4 \
		-D NAME=$(NAME) \
		-D EMAIL=$(EMAIL) \
		git/config.m4 > $@

install-aws : install-sh
	ln -s -- $(PWD)/aws/profile.d/* $(HOME)/.profile.d/

install-bash : clean-bash install-sh
	mkdir -p -- $(HOME)/.bashrc.d
	ln -s -- $(PWD)/bash/bashrc $(HOME)/.bashrc
	ln -s -- $(PWD)/bash/bash_profile $(HOME)/.bash_profile
	ln -s -- $(PWD)/bash/bashrc.d/* $(HOME)/.bashrc.d/

install-brew :
	brew update
	(cd homebrew; brew bundle)

install-conf :
	sh install/conf.sh

install-git : git/config clean-git
	mkdir -p -- $(XDG_CONFIG_HOME)/git
	ln -s -- $(PWD)/git/config $(XDG_CONFIG_HOME)/git/config

install-nvm : install-bash
	sh install/nvm.sh
	ln -s -- $(PWD)/nvm/profile.d/* $(HOME)/.profile.d/
	ln -s -- $(PWD)/nvm/bashrc.d/* $(HOME)/.bashrc.d/

install-sh : clean-sh
	mkdir -p -- $(HOME)/.profile.d
	ln -s -- $(PWD)/sh/profile $(HOME)/.profile
	ln -s -- $(PWD)/sh/profile.d/* $(HOME)/.profile.d/

install-vim : clean-vim
	mkdir -p -- $(HOME)/.vim
	mkdir -p -- $(XDG_CACHE_HOME)/vim/{backup,swap,undo}
	ln -s -- $(PWD)/vim/filetype.vim $(HOME)/.vim/filetype.vim
	ln -s -- $(PWD)/vim/vimrc $(HOME)/.vim/vimrc
	ln -s -- $(PWD)/vim/after $(HOME)/.vim/after

install-work : install-sh
	ln -s -- $(PWD)/work/profile.d/* $(HOME)/.profile.d/
	ln -s -- $(PWD)/work/bashrc.d/* $(HOME)/.bashrc.d/

clean-bash :
	rm -f -- $(HOME)/.bashrc
	rm -f -- $(HOME)/.bash_profile
	rm -rf -- $(HOME)/.bashrc.d

clean-git :
	rm -f -- $(XDG_CONFIG_HOME)/git/config

clean-sh :
	rm -f -- $(HOME)/.profile
	rm -rf -- $(HOME)/.profile.d

clean-vim :
	rm -f -- $(HOME)/.vim/filetype.vim
	rm -f -- $(HOME)/.vim/vimrc
	rm -r -- $(HOME)/.vim/after

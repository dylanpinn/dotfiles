XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share

install : install-bash \
	install-brew \
	install-vim

brew-dump :
	(cd homebrew; brew bundle dump --force --describe)


install-bash : clean-bash install-sh
	ln -s -- $(PWD)/bash/bashrc $(HOME)/.bashrc
	ln -s -- $(PWD)/bash/bash_profile $(HOME)/.bash_profile

install-brew :
	brew update
	(cd homebrew; brew bundle)

install-sh : clean-sh
	ln -s -- $(PWD)/sh/profile $(HOME)/.profile

install-vim : clean-vim
	mkdir -p -- $(HOME)/.vim
	ln -s -- $(PWD)/vim/filetype.vim $(HOME)/.vim/filetype.vim
	ln -s -- $(PWD)/vim/vimrc $(HOME)/.vim/vimrc

clean-bash :
	rm -f -- $(HOME)/.bashrc
	rm -f -- $(HOME)/.bash_profile

clean-sh :
	rm -f -- $(HOME)/.profile

clean-vim :
	rm -f -- $(HOME)/.vim/filetype.vim
	rm -f -- $(HOME)/.vim/vimrc

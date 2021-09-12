install : install-bash \
	install-brew

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

clean-bash :
	rm -f -- $(HOME)/.bashrc
	rm -f -- $(HOME)/.bash_profile

clean-sh :
	rm -f -- $(HOME)/.profile

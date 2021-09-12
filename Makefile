install : install-bash

brew-dump :
	brew bundle dump --force --describe


install-bash : clean-bash
	ln -s -- $(PWD)/bash/bashrc $(HOME)/.bashrc
	ln -s -- $(PWD)/bash/bash_profile $(HOME)/.bash_profile


clean-bash :
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.bash_profile

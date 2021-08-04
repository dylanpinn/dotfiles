XDG_CACHE_HOME = $(HOME)/.cache
XDG_CONFIG_HOME = $(HOME)/.config
XDG_DATA_HOME = $(HOME)/.local/share

all: install-shared

brew-dump:
	brew bundle dump --force --describe

install-shared: install-brew \
	install-sh \
	install-bash \
	install-git \
	install-nvm \
	install-python-pkgs \
	install-vim \
	install-vint

install-personal: install-shared
	stow -v -R -t ~ personal

install-work: install-shared
	stow -v -R -t ~ work

install-bash:
	@echo "Installing bash..."
	stow -v -R -t ~ bash

install-brew:
	@echo "Installing dependencies..."
	brew update
	brew bundle --verbose

install-git:
	@echo "Installing git..."
	mkdir -p -- $(XDG_CONFIG_HOME)/git
	stow -v -R -t ~ git

install-nvm:
	@echo "Installing nvm..."
	./install/nvm.sh

install-python-pkgs:
	@echo "Installing Python packages..."
	pip3 install -r requirements.txt

install-sh:
	@echo "Installing sh..."
	stow -v -R -t ~ sh

install-vim:
	@echo "Installing vim..."
	mkdir -p ~/.vim/{backups,swaps,undo}
	stow -v -R -t ~ vim
	./install/vim.sh

install-vint:
	@echo "Installing vint..."
	stow -v -R -t ~ vint

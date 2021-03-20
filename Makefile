XDG_CACHE_HOME = $(HOME)/.cache
XDG_CONFIG_HOME = $(HOME)/.config
XDG_DATA_HOME = $(HOME)/.local/share

all: install-brew \
	install-sh \
	install-bash \
	install-git \
	install-emacs \
	install-neovim \
	install-npm \
	install-nvm \
	install-python-pkgs \
	install-vim \
	install-vint \
	install-yarn

install-bash:
	@echo "Installing bash..."
	stow -v -R -t ~ bash

install-brew:
	@echo "Installing dependencies..."
	brew update
	brew bundle --verbose

install-emacs:
	@echo "Installing emacs..."
	stow -v -R -t ~ emacs

install-git:
	@echo "Installing git..."
	mkdir -p -- $(XDG_CONFIG_HOME)/git
	stow -v -R -t ~ git

install-neovim:
	@echo "Installing neovim..."
	stow -v -R -t ~ nvim

install-npm: install-sh
	@echo "Installing npm..."
	stow -v -R -t ~ npm

install-nvm:
	@echo "Installing nvm..."
	./install/nvm.sh

install-python-pkgs:
	@echo "Installing Python packages..."
	pip3 install -r requirements.txt

install-sh:
	@echo "Installing sh..."
	mkdir -p -- ~/.profile.d
	stow -v -R -t ~ sh

install-vim:
	@echo "Installing vim..."
	# mkdir -p ~/.vim/{backups,swaps,undo}
	mkdir -p -- $(XDG_CACHE_HOME)/vim/{backup,swap}
	stow -v -R -t ~ vim
	# ./install/vim.sh

install-vint:
	@echo "Installing vint..."
	stow -v -R -t ~ vint

install-yarn: install-sh
	@echo "Installing yarn..."
	stow -v -R -t ~ yarn

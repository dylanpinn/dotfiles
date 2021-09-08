XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share

all: install-shared

brew-dump:
	brew bundle dump --force --describe

install-shared: install-brew \
	install-bash \
	install-bin \
	install-emacs \
	install-git \
	install-nvm \
	install-vim \
	install-wakatime

install-personal: install-shared
	stow -v -R -t ~ personal

install-work: install-shared \
	install-neovim \
	install-postgres \
	install-sbt \
	install-scala \
	install-yarn
	stow -v -R -t ~ work

install-bash: install-sh
	@echo "Installing bash..."
	stow -v -R -t ~ bash

install-brew:
	@echo "Installing dependencies..."
	brew update
	brew bundle --verbose

install-docker: install-sh
	@echo "Installing docker..."
	stow -v -R -t ~ docker

install-emacs:
	@echo "Installing emacs..."
	stow -v -R -t ~ emacs

install-git:
	@echo "Installing git..."
	mkdir -p -- $(XDG_CONFIG_HOME)/git
	stow -v -R -t ~ git

install-neovim: install-tree-sitter
	@echo "Installing neovim..."
	@mkdir -p -- $(XDG_CONFIG_HOME)/nvim/{after,plugin}
	@mkdir -p -- $(XDG_CONFIG_HOME)/nvim/after/ftplugin
	stow -v -t ~ nvim
	stow -v -t $(XDG_CONFIG_HOME)/nvim/ vim-shared
	./install/nvim.sh

install-nvm:
	@echo "Installing nvm..."
	stow -v -R -t ~ nvm
	./install/nvm.sh

install-postgres:
	@echo "Installing postgres..."
	stow -v -R -t ~ postgres
	mkdir -p $(XDG_CONFIG_HOME)/pg && mkdir -p $(XDG_CACHE_HOME)/pg

install-python-pkgs:
	@echo "Installing Python packages..."
	pip3 install -r requirements.txt

install-sbt:
	@echo "Installing sbt..."
	stow -v -R -t ~ sbt

install-scala: install-bash
	@echo "Installing Scala..."
	stow -R -t ~ scala

install-sh:
	@echo "Installing sh..."
	mkdir -p -- ~/.profile.d
	stow -v -R -t ~ sh

install-tree-sitter: install-sh
	@echo "Installing tree-sitter..."
	stow -v -R -t ~ tree-sitter

install-vim:
	@echo "Installing vim..."
	@mkdir -p -- $(XDG_CACHE_HOME)/vim/{backup,swap,undo}
	@mkdir -p -- ~/.vim/plugin
	stow -t ~ vim
	stow -t ~/.vim/ vim-shared
	./install/vim.sh

install-wakatime: install-sh
	@echo "Installing wakatime..."
	@mkdir -p -- $(XDG_CONFIG_HOME)/wakatime
	stow -v -R -t ~ wakatime

install-yarn: install-sh
	@echo "Installing yarn..."
	mkdir -p -- $(XDG_CONFIG_HOME)/yarn
	touch $(XDG_CONFIG_HOME)/yarn/config
	stow -v -R -t ~ yarn

XDG_CACHE_HOME = $(HOME)/.cache
XDG_CONFIG_HOME = $(HOME)/.config
XDG_DATA_HOME = $(HOME)/.local/share

all: install-brew \
	install-nvm
# 	install-sh \
# 	install-bash \
# 	install-bin \
# 	install-docker \
# 	install-git \
# 	install-emacs \
# 	install-neovim \
# 	install-npm \
# 	install-python-pkgs \
# 	install-vim \
# 	install-terminfo \
# 	install-tree-sitter \
# 	install-vint \
# 	install-yarn

install-bash:
	@echo "Installing bash..."
	stow -v -R -t ~ bash

install-bin:
	@echo "Installing bin..."
	@mkdir -p -- $(HOME)/.local/bin
	stow -R -t $(HOME)/.local/bin/ bin

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

install-neovim:
	@echo "Installing neovim..."
	@mkdir -p -- $(XDG_CONFIG_HOME)/nvim/{after,plugin}
	stow -v -t ~ nvim
	stow -v -t $(XDG_CONFIG_HOME)/nvim/ vim-shared
	./install/nvim.sh

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

install-terminfo:
	@echo "Installing terminfo..."
	tic terminfo/xterm-256color-italic.terminfo

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

install-vint:
	@echo "Installing vint..."
	stow -v -R -t ~ vint

install-yarn: install-sh
	@echo "Installing yarn..."
	mkdir -p -- $(XDG_CONFIG_HOME)/yarn
	stow -v -R -t ~ yarn

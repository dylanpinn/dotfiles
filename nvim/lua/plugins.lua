vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	use 'neovim/nvim-lspconfig'

	use 'folke/tokyonight.nvim'
end)

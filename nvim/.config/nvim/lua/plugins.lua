-- luacheck: globals vim

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use {'dracula/vim', as = 'dracula'}

  -- Attempt to standardise indentation and other styling by reading
  -- configuration values from a .editorconfig file if present.  This is loaded
  -- on demand only if there is a .editorconfig file present at the :pwd path.
  use {'editorconfig/editorconfig-vim', opt = true, as = 'editorconfig'}

  -- Use treesitter to improve syntax highlighting.
  use {'nvim-treesitter/nvim-treesitter'}
  require('settings/treesitter')

  -- Configure and use the built in LSP server for Neovim.
  use {'neovim/nvim-lspconfig'}
  require('settings/lspconfig')

  -- Track development effort across projects.
  use {'wakatime/vim-wakatime'}
end)

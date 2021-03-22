-- luacheck: globals vim

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use {'dracula/vim', as = 'dracula'}

  -- Apply consisistent editor settings for a project.  Tracked in
  -- a .editorconfig file.
  use {'editorconfig/editorconfig-vim', opt = true, as = 'editorconfig'}

  -- Use treesitter to improve syntax highlighting.
  use {'nvim-treesitter/nvim-treesitter'}
  require('settings/nvim-treesitter')

  -- Configure and use the built in LSP server for Neovim.
  use {'neovim/nvim-lspconfig'}
  require('settings/nvim-lspconfig')

  -- Track development effort across projects.
  use {'wakatime/vim-wakatime'}
end)

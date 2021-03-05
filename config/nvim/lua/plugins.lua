require('packer').startup(function(use)
  -- Package manager, loaded optionally when required to update.
  use {'wbthomason/packer.nvim', opt = true}

  -- Minimal vim completion plugin, <Tab> can cycles built in completion
  -- methods.
  use {'ajh17/VimCompletesMe'}

  -- Simple dark theme.
  use {'dracula/vim', as = 'dracula'}

  -- Configure and use the built in LSP server for Neovim.
  use {'neovim/nvim-lspconfig'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'tpope/vim-projectionist'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-vinegar'}
  use {'wakatime/vim-wakatime'}
end)


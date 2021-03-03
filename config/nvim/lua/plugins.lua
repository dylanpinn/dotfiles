require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  use {'ajh17/VimCompletesMe'}
  use {'dracula/vim', as = 'dracula'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'tpope/vim-projectionist'}
  use {'wakatime/vim-wakatime'}
end)


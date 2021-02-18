require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  use {'wakatime/vim-wakatime'}
  use {'dracula/vim', as = 'dracula'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'ajh17/VimCompletesMe'}
end)


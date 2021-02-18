require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  use {'wakatime/vim-wakatime'}
  use {'dracula/vim', as = 'dracula'}
end)


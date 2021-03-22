-- luacheck: globals vim

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {'dracula/vim', as = 'dracula'}

  use {'wakatime/vim-wakatime'}
  use {'editorconfig/editorconfig-vim', opt = true, as = 'editorconfig'}
end)

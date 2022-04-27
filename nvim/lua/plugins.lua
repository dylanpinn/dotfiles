return require('packer').startup(function()
  -- Use Packer to manage it self
  use 'wbthomason/packer.nvim'

  -- Use Metals for Scala development.
  use {
    'scalameta/nvim-metals',
    requires = { "nvim-lua/plenary.nvim" },
    config = 'vim.opt_global.shortmess:remove("F")'
  }
end)

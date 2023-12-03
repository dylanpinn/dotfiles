-- Third party plugins are typically chosen if they are lightweight and don't
-- duplicate existing functionality.

-- Use Paq to manage plugins for Neovim, it is lightweight and uses native Vim
-- built-in packages under the hood.
return require("paq")({
  "savq/paq-nvim", -- Let Paq manage itself

  -- Treesitter configuration; this is required to integrate Treesitter.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Enhance (n)vim.
  -- "tpope/vim-dispatch",
  -- "tpope/vim-repeat",
  -- "tpope/vim-surround",

  -- LSP configuration; this makes configuring LSP servers easier.
  "neovim/nvim-lspconfig",
})

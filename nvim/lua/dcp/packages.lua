-- Third party plugins are typically chosen if they are lightweight and don't
-- duplicate existing functionality.

-- Use Paq to manage plugins for Neovim, it is lightweight and uses native Vim
-- built-in packages under the hood.
return require("paq")({
  "savq/paq-nvim", -- Let Paq manage itself

  -- Treesitter configuration; this is required to integrate Treesitter.
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      vim.cmd("TSUpdate")
    end,
  },

  -- LSP configuration; this makes configuring LSP servers easier.
  "neovim/nvim-lspconfig",
  -- Automatically download Neovim LSP servers
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "jayp0521/mason-null-ls.nvim",
  "nvim-lua/plenary.nvim",

  -- Colorscheme
  { "catppuccin/nvim", as = "catppuccin" },
})

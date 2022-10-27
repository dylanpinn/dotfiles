-- Use Paq to manage plugins for Neovim, it is light weight so fingers crossed
-- I won't need any of the missing features from Packer.
return require("paq")({
  "savq/paq-nvim", -- Let Paq manage itself
  "williamboman/mason.nvim", -- Portable package manager for Neovim.
  "williamboman/mason-lspconfig.nvim", -- Extension for Mason.nvim that makes it easier to use lspconfig.
  "neovim/nvim-lspconfig", -- Collection of configurations for the built-in LSP client.
  "nvim-lua/plenary.nvim", -- Lua functions. null-ls requires this.
  "jose-elias-alvarez/null-ls.nvim", -- Allow linters & formatters to connect to LSP client.
  {"catppuccin/nvim", as="catppuccin"}
})

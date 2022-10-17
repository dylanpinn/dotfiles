-- Use Paq to manage plugins for Neovim, it is light weight so fingers crossed
-- I won't need any of the missing features from Packer.
return require("paq")({
  "savq/paq-nvim", -- Let Paq manage itself
  "williamboman/mason.nvim", -- Portable package manager for Neovim.
  "neovim/nvim-lspconfig", -- Collection of configurations for the built-in LSP client.
})

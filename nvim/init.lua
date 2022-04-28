-- This is my Neovim configuration.  I am trying to replace Vim with Neovim so
-- I can get native LSP support for TypeScript and Scala projects.

-- Use the built in desert color scheme until I find something I like more.
vim.cmd("colorscheme desert")

-- Use Paq to manage plugins for Neovim, it is light weight so fingers crossed
-- I won't need any of the missing features from Packer.
require "paq" {
  "savq/paq-nvim";                  -- Let Paq manage itself
}

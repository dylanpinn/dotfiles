-- Third party plugins are typically chosen if they are lightweight and don't
-- duplicate existing functionality.

-- Use Paq to manage plugins for Neovim, it is lightweight and uses native Vim
-- built-in packages under the hood.
return require("paq")({
  "savq/paq-nvim", -- Let Paq manage itself
})

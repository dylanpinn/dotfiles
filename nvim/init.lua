-- This is my Neovim configuration.  I am trying to replace Vim with Neovim so
-- I can get native LSP support for TypeScript and Scala projects.

-- Use the built in desert color scheme until I find something I like more.
vim.cmd("colorscheme tokyonight")

-- Load all external plugins via a module.  This allows keeping this file to be
-- a tad smaller and keeps the plugin declaration in a separate file.
require("dcp.packages")
require("dcp.lsp")

-- Mapping defnitions are defined here.  Here are some rules I have tried to
-- follow as much as possible.
--
-- * Use Leader key as a prefix for mappings as much as possible.
--
-- * Only use the LocalLeader key as a prefix for mappings that are defined as
--   local to a buffer, which should always be based on filetype and be setup
--   in ftplugin files.
--
-- * Avoid shadowing any of Vim's existing functionality.  If possible, extend
--   or supplement what Vim does, rather than replacing it.
--
-- The following are mappings that do not use the Leader key.

-- The idea for this is taken from tpop/vim-vinegar.  Being able to hit "-" and
-- be taken automatically the files directory in netrw is very helpful and much
-- easier than typing ":Ex".  Only stealing this keybinding at the moment
-- (definitely not as powerful as the original) as don't require the rest of
-- the plugin (currently).
--
vim.keymap.set("n", "-", ":Ex<CR>")

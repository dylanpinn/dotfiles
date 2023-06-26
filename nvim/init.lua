-- This is my personal Neovim config.
--
-- It is intentionally very bare bones and using the features of Neovim that
-- are missing from Vim, i.e. LSP and treesitter.

-- Enable experimental lua-loader to byte-compile and cache lua files.
vim.loader.enable()

-- The configuration is located in the dcp module (located in the lua
-- directory). It is then split up based on the type of configuration to make
-- small files rather than a single large file (vimrc).
require("dcp")

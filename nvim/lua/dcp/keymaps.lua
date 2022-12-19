-- Mapping definitions are defined here.  Here are some rules I have tried to
-- follow as much as possible.
--
-- * Use Leader key as a prefix for mappings as much as possible.
--
-- * Only use the LocalLeader key as a prefix for mappings that are defined as
-- local to a buffer, which should always be based on filetype and be setup in
-- ftplugin files.
--
-- * Avoid shadowing any of Vim's existing functionality.  If possible, extend
-- or supplement what Vim does, rather than replacing it.
--
-- The following are mappings that do not use the Leader key.
--

-- The following maps use the Leader key.
--
-- Let us set the leader keys; backslash happens to be the default but setting
-- it explicitly here.  Setup space as the local leader (rather than shadowing
-- an existing binding such as ',').
--
vim.g.mapleader = '\\'
vim.g.maplocalleader = ' '

-- Leader,n toggles line number display.
vim.keymap.set('n', '<Leader>n', "<cmd>set number!<CR>")

-- Leader,s toggles spell checking.
vim.keymap.set('n', '<Leader>s', "<cmd>set spell!<CR>")
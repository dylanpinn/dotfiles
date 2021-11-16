local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

vim.g.mapleader = '\\'
vim.g.maplocalleader = ','

-- Leader,c toggles highlighted cursor row.
map('n', '<Leader>c', ':<C-U>set cursorline! cursorline?<CR>', default_opts)
-- Leader,l toggles showing tab, end-of-line, and trailing white space.
map('n', '<Leader>l', ':<C-U>set list! list?<CR>', default_opts)
-- Leader,n toggles line number display
map('n', '<Leader>n', ':<C-U>set number! number?<CR>', default_opts)
-- Leader,s toggles spell checking.
map('n', '<Leader>s', ':<C-U>set spell! spell?<CR>', default_opts)
-- Leader,w toggles soft wrapping
map('n', '<Leader>w', ':<C-U>set wrap! wrap?<CR>', default_opts)

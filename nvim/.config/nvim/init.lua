-- luacheck: globals vim

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Load plugin configuration
require('plugins')

-- Options
-- Most of these options have come from my vimrc. See there for notes on why
-- these options are added.

-- vim.o['backup'] = true
-- vim.o['backupdir'] = '~/.local/share/nvim/backup//'
vim.o['undofile'] = true
vim.bo['spelllang'] = 'en_au'

vim.api.nvim_command(':set path-=/usr/include') -- Remove unused directory from path.

vim.wo['linebreak'] = true
vim.o['showbreak'] = '> '
vim.wo['breakindent'] = true

vim.api.nvim_command('set formatoptions+=1')
vim.api.nvim_command('set cpoptions+=J')
vim.api.nvim_command('set formatoptions+=p')

vim.o['ignorecase'] = true
vim.o['smartcase'] = true

vim.o['lazyredraw'] = true

vim.api.nvim_command('set listchars+=extends:>,precedes:<')

vim.bo['modeline'] = false

vim.o['splitbelow'] = true
vim.o['splitright'] = true

vim.api.nvim_command('set virtualedit+=block')

vim.o['wildmode'] = 'list:longest,full'
vim.api.nvim_command('set wildignore+=*/node_modules/*')
vim.o['wildignorecase'] = true

vim.cmd('colorscheme dracula')

-- Mappings
vim.g['mapleader'] = '\\'
vim.g['maplocalleader'] = ','

map('n', '<C-L>', ':<C-U>nohlsearch<CR><C-L>')
map('n', '-', ':Ex<CR>')
map('n', '<Leader>c', ':<C-U>set cursorline! cursorline?<CR>')
map('n', '<Leader>l', ':<C-U>set list! list?<CR>')
map('n', '<Leader>n', ':<C-U>set number! number?<CR>')
map('n', '<Leader>s', ':<C-U>set spell! spell?<CR>')
map('n', '<Leader>w', ':<C-U>set wrap! wrap?<CR>')

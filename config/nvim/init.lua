local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local execute = vim.api.nvim_command

local function opt(scope, key, value)
  local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
  scopes[scope][key] = value
  if scope ~= 'o' then
    scopes['o'][key] = value
  end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

----------------------------------
-- SETUP PLUGINS -----------------------
----------------------------------
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

require 'plugins'

require('nvim-treesitter.configs').setup {
  ensure_installed = {'html', 'javascript', 'yaml', 'css', 'typescript', 'lua', 'json'},
  highlight = {enable = true},
}

----------------------------------
-- VARIABLES ---------------------
----------------------------------
g['mapleader'] = ','

----------------------------------
-- OPTIONS -----------------------
----------------------------------
opt('o', 'path', 'src/**')

-- MAPPINGS ----------------------
-- insert-mode mappings
-- normal-mode mappings
map('n', '<C-L>', ':nohlsearch<CR>')
map('n', '<Leader>e', ':edit **/')
map('n', '<Leader>f', ':find ')

-- LSP
map('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')

----------------------------------
-- COMMANDS ----------------------
----------------------------------
cmd 'colorscheme dracula'

----------------------------------
-- LSP Setup ---------------------
----------------------------------
local lsp_config = require 'lspconfig'

lsp_config.tsserver.setup {}

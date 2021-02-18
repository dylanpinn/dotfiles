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

----------------------------------
-- COMMANDS ----------------------
----------------------------------
cmd 'colorscheme dracula'

----------------------------------
-- LSP Setup ---------------------
----------------------------------

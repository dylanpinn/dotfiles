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

-- require('nvim-treesitter.configs').setup {
--   ensure_installed = {'html', 'javascript', 'css', 'typescript', 'lua', 'json'},
--   highlight = {enable = true},
-- }

----------------------------------
-- VARIABLES ---------------------
----------------------------------
g['mapleader'] = ','

----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global ------------------------
opt('o', 'undofile', true)    -- Persist undo between sessions.
opt('o', 'splitbelow', true)  -- New horizontal splits below, not above.
opt('o', 'splitright', true)  -- New vertical splits on the right, not left.
opt('o', 'ignorecase', true)  -- Ignore case when searching.
opt('o', 'smartcase', true)   -- Ignore case unless all CAPS.

opt('o', 'wildignorecase', true)   -- Ignore case in the Ex command line.

-- Use ripgrep as default grep program, this is faster than "grep" and also
-- performs recursive search and respects ignore files by default.
opt('o', 'grepprg', 'rg --vimgrep --no-heading --smart-case')

vim.api.nvim_command(':set path-=/usr/include') -- Remove unused directory from path.

-- window-scoped -----------------
opt('w', 'number', true) 	-- Show line numbers.
opt('w', 'cursorline', true) 	-- Show line numbers.

-- buffer-scoped ----------------
opt('b', 'tabstop', 2)     		-- Number of visual spaces per <Tab>.
opt('b', 'softtabstop', 2)  	-- Number of spaces in <Tab> when editing.
opt('b', 'expandtab', true)   -- Tabs are spaces.
opt('b', 'shiftwidth', 2)     -- Number of spaces when visual indenting.


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
local lsp_config = require 'lspconfig'

-- Enable basic snippet support.
require'snippets'.use_suggested_mappings()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Incorporate LSP completions into omnifunc.
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Set LSP keybindings. Try to enhance existing vim functionality where possible.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

  -- Taken from lsp-config docs.
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "tsserver" }
for _, lsp in ipairs(servers) do
  lsp_config[lsp].setup { on_attach = on_attach, capabilities = capabilities }
end

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = vim.fn.getenv("HOME").."/.local/bin/sumneko_lua"
lsp_config.sumneko_lua.setup {
  cmd = { sumneko_root_path .. "/bin/"..system_name.."/lua-language-server", "-E", sumneko_root_path .. "/main.lua"};
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
      Lua = {
          runtime = {
              -- Tell the language server which version of Lua you're using (LuaJIT in the case of Neovim)
              version = 'LuaJIT',
              -- Setup your lua path
              path = vim.split(package.path, ';'),
          },
          diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
          },
          workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                  [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
              },
          },
      },
  },
}


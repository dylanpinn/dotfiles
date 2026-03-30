-- Keep line length within the required default by luacheck.
vim.opt_local.colorcolumn = "+1"
vim.opt_local.textwidth = 120
vim.opt_local.number = true

-- Tabs should have 4 space width.
vim.opt_local.tabstop = 4

-- Use luacheck as compiler for lua files.
vim.cmd([[compiler luacheck]])

-- Use Treesitter for highlighting, folding and indentation.
vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- Snippets to create Lua functions.
vim.snippet.add("fn", "function ${1:name}($2)\n\t${3:-- content}\nend", { buffer = 0 })
vim.snippet.add("lfn", "local function ${1:name}($2)\n\t${3:-- content}\nend", { buffer = 0 })

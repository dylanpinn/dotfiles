-- Tabs should have 4 space width.
vim.opt_local.tabstop = 4

-- Use luacheck as compiler for lua files.
vim.cmd([[compiler luacheck]])

-- Show line numbers by default.
vim.o.number = true

-- Enable treesitter for syntax highlighting.
pcall(vim.treesitter.start)

-- Enable treesitter for folding.
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

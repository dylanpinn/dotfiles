-- Format whole file using Prettier.
-- There are issues using formatprg, so running this as a separate command
-- seems the best solution that doesn't involve a new plugin.
vim.keymap.set("n", "<LocalLeader>f", ":silent %!npx prettier --stdin-filepath %<CR>")

-- Use Treesitter for highlighting, folding and indentation.
vim.treesitter.start()
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

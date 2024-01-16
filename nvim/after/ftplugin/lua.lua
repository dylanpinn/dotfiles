-- Tabs should have 4 space width.
vim.opt_local.tabstop = 4

-- Use stylua as formatter if it is available.
if vim.fn.executable("stylua") == 1 then
	vim.opt_local.formatprg = "stylua --stdin-filepath % --search-parent-directories -"
end

-- Use luacheck as compiler for sh files.
vim.cmd([[compiler luacheck]])

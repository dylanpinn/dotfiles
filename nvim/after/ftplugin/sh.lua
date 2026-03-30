-- Use shfmt as formatter if it is available.
if vim.fn.executable("shfmt") == 1 then
	vim.opt_local.formatprg = "shfmt"
end

-- Use shellcheck as compiler for sh files.
vim.cmd([[compiler shellcheck]])

-- Keep line length within the required default by luacheck.
vim.opt_local.colorcolumn = "+1"
vim.opt_local.textwidth = 80
vim.opt_local.number = true

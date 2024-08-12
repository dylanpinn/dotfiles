vim.opt.runtimepath:append(
	vim.fs.joinpath(
		vim.fn.stdpath("data") --[[@as string]],
		"rocks",
		"lib",
		"luarocks",
		"rocks-5.1",
		"tree-sitter-*",
		"*"
	)
)

-- Move this to ftplugin file and maybe setup helper function to enable TS for syntax and folding.
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

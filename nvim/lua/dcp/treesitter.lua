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
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

require("lint").linters_by_ft = {
	lua = { "luacheck" },
	typescript = { "eslint" },
}

-- This will run the linters on save.
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

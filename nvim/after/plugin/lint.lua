require("lint").linters_by_ft = {
	dockerfile = { "hadolint" },
	lua = { "luacheck" },
	markdown = { "vale" },
	typescript = { "eslint" },
	typescriptreact = { "eslint" },
}

-- This will run the linters on save.
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft` for the current filetype
		require("lint").try_lint()
	end,
})

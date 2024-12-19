return {
	{
		"stevearc/conform.nvim",
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- typescript = { { "prettierd", "prettier" }, "eslint_d" },
			},
		},
	},
}

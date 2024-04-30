local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { { "prettierd", "prettier" }, "eslint_d" },
	},
}

require("conform").setup(options)

-- This should be okay to set globally, as will default back to the LSP
-- formatexpr if present and then to nothing.
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

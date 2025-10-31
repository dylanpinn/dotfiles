---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
	local conform = require("conform")
	for i = 1, select("#", ...) do
		local formatter = select(i, ...)
		if conform.get_formatter_info(formatter, bufnr).available then
			return formatter
		end
	end
	return select(1, ...)
end

local options = {
	formatters_by_ft = {
		bash = { "shfmt" },
		lua = { "stylua" },
		typescript = function(bufnr)
			return { first(bufnr, "prettierd", "prettier"), "eslint_d" }
		end,
		sh = { "shfmt" },
	},
}

require("conform").setup(options)
require("conform").formatters.shfmt = {
	append_args = { "--simplify" },
}

-- This should be okay to set globally, as will default back to the LSP
-- formatexpr if present and then to nothing.
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- Link quickfix list to Neovim diagnostics.
-- Useful if using compilers with make % to show errors.

local ns = vim.api.nvim_create_namespace("make_diagnostics")

local severity_map = {
	E = vim.diagnostic.severity.ERROR,
	W = vim.diagnostic.severity.WARN,
	I = vim.diagnostic.severity.INFO,
	N = vim.diagnostic.severity.HINT,
}

local function qf_to_diagnostics()
	-- Clear old diagnostics across all buffers in this namespace
	vim.diagnostic.reset(ns)

	local diags_by_buf = {}

	for _, item in ipairs(vim.fn.getqflist()) do
		if item.valid == 1 and item.bufnr > 0 then
			if not diags_by_buf[item.bufnr] then
				diags_by_buf[item.bufnr] = {}
			end
			table.insert(diags_by_buf[item.bufnr], {
				lnum = math.max(0, item.lnum - 1),
				col = math.max(0, item.col - 1),
				end_lnum = item.end_lnum > 0 and (item.end_lnum - 1) or nil,
				end_col = item.end_col > 0 and (item.end_col - 1) or nil,
				severity = severity_map[item.type] or vim.diagnostic.severity.ERROR,
				message = item.text,
				source = "make",
			})
		end
	end

	for bufnr, diags in pairs(diags_by_buf) do
		vim.diagnostic.set(ns, bufnr, diags)
	end
end

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	pattern = { "make", "lmake" },
	callback = qf_to_diagnostics,
})

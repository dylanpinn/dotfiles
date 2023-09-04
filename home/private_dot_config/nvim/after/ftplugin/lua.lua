-- Set maximum text width to 120 chars.
vim.opt_local.textwidth = 120

-- Use stylua as formatter if it is available.
if vim.fn.executable("stylua") == 1 then
  vim.opt_local.formatprg = "stylua --stdin-filepath % --search-parent-directories -"
end

-- Use shfmt as formatter if it is available.
if vim.fn.executable("shfmt") == 1 then
  vim.opt_local.formatprg = "shfmt"
end

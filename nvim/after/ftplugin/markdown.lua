-- Format files using LSP formatter (should be Prettier).
vim.keymap.set("n", "<localleader>f", function()
  vim.lsp.buf.format({ async = true })
end)

-- Unfold all by start.
vim.opt_local.foldlevel = 99

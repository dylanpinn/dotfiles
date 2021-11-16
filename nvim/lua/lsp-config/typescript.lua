local keybindings = require('lsp-config/keybindings')

return require'lspconfig'.tsserver.setup{
  on_attach = keybindings.on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}


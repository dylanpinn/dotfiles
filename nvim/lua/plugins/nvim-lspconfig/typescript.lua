local keybindings = require('plugins/nvim-lspconfig/keybindings')

return require'lspconfig'.tsserver.setup{
  on_attach = keybindings.on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}


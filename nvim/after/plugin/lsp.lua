-- local ok, mason = pcall(require, "mason")
-- if not ok then
--   return
-- end
-- -- Setup Mason before any LSP configuration.
-- mason.setup()
-- require("mason-lspconfig").setup()
-- local null_ls = require("null-ls")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<localleader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<localleader>q", vim.diagnostic.setloclist, opts)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<localleader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<localleader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<localleader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<localleader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<localleader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<localleader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<localleader>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

require("lspconfig").sumneko_lua.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

require("lspconfig").tsserver.setup({
  on_attach = on_attach,
})

--null_ls.setup({
--  sources = {
--    -- Code Actions
--    null_ls.builtins.code_actions.eslint_d,
--    -- Diagnostics
--    null_ls.builtins.diagnostics.eslint_d,
--    null_ls.builtins.diagnostics.luacheck,
--    -- Formatting
--    null_ls.builtins.formatting.prettier,
--    null_ls.builtins.formatting.stylua,
--  },
--})
--require("mason-null-ls").setup({
--  ensure_installed = nil,
--  automatic_installation = true,
--  automatic_setup = false,
--})

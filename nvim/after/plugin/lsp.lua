-- Setup language servers.
vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using (most
				-- likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Tell the language server how to find Lua modules same way as Neovim
				-- (see `:h lua-module-load`)
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths
					-- here.
					-- '${3rd}/luv/library',
					-- '${3rd}/busted/library',
				},
				-- Or pull in all of 'runtimepath'.
				-- NOTE: this is a lot slower and will cause issues when working on
				-- your own configuration.
				-- See https://github.com/neovim/nvim-lspconfig/issues/3189
				-- library = vim.api.nvim_get_runtime_file('', true),
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

vim.lsp.enable("lua_ls")

-- Global default keymaps for LSP
-- "gra" is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
-- "gri" is mapped in Normal mode to vim.lsp.buf.implementation()
-- "grn" is mapped in Normal mode to vim.lsp.buf.rename()
-- "grr" is mapped in Normal mode to vim.lsp.buf.references()
-- "grt" is mapped in Normal mode to vim.lsp.buf.type_definition()
-- "grx" is mapped in Normal mode to vim.lsp.codelens.run()
-- "gO" is mapped in Normal mode to vim.lsp.buf.document_symbol()
-- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()
-- "an" and "in" are mapped in Visual mode to outer and inner incremental selections, respectively,
-- 		using vim.lsp.buf.selection_range() if treesitter not active
-- gx handles textDocuent/documentLink

-- Buffer-local defaults
-- 'omnifunc' is set to vim.lsp.omnifunc(), use i_CTRL-X_CTRL-O to trigger completion.
-- 'tagfunc' is set to vim.lsp.tagfunc(). This enables features like go-to-definition, :tjump, and
-- 		keymaps like CTRL-], CTRL-W_], CTRL-W_} to utilize the language server.
-- 'formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it.
-- To opt out of this use gw instead of gq, or clear 'formatexpr' on LspAttach.
-- K is mapped to vim.lsp.buf.hover() unless 'keywordprg' is customized or a custom keymap for K exists.
-- Document colors are enabled for highlighting color references in a document.
-- To opt out call `vim.lsp.document_color.enable(false, { bufnr = ev.buf })` on |LspAttach|.

-- Diagnistic Defaults
-- These diagnostic keymaps are created unconditionally when Nvim starts:
-- ]d jumps to the next diagnostic in the buffer. ]d-default
-- [d jumps to the previous diagnostic in the buffer. [d-default
-- ]D jumps to the last diagnostic in the buffer. ]D-default
-- [D jumps to the first diagnostic in the buffer. [D-default
-- <C-w>d shows diagnostic at cursor in a floating window. CTRL-W_d-default

-- -- Global mappings.
vim.keymap.set("n", "<localleader>q", vim.diagnostic.setloclist)

-- -- Setup language servers.
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
					-- '${3rd}/luv/library'
					-- '${3rd}/busted/library'
				},
				-- Or pull in all of 'runtimepath'.
				-- NOTE: this is a lot slower and will cause issues when working on
				-- your own configuration.
				-- See https://github.com/neovim/nvim-lspconfig/issues/3189
				-- library = {
				--   vim.api.nvim_get_runtime_file('', true),
				-- }
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
-- "gO" is mapped in Normal mode to vim.lsp.buf.document_symbol()
-- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()
-- "an" and "in" are mapped in Visual mode to outer and inner incremental selections, respectively,
-- 		using vim.lsp.buf.selection_range()

-- Buffer-local defaults
-- 'omnifunc' is set to vim.lsp.omnifunc(), use i_CTRL-X_CTRL-O to trigger completion.
-- 'tagfunc' is set to vim.lsp.tagfunc(). This enables features like go-to-definition, :tjump, and
-- 		keymaps like CTRL-], CTRL-W_], CTRL-W_} to utilize the language server.
-- 'formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it.
-- To opt out of this use gw instead of gq, or clear 'formatexpr' on LspAttach.
-- K is mapped to vim.lsp.buf.hover() unless 'keywordprg' is customized or a custom keymap for K exists.
-- Document colors are enabled for highlighting color references in a document.
-- To opt out call vim.lsp.document_color.enable(false, args.buf) on LspAttach.

-- Diagnistic Defaults
-- These diagnostic keymaps are created unconditionally when Nvim starts:
-- ]d jumps to the next diagnostic in the buffer. ]d-default
-- [d jumps to the previous diagnostic in the buffer. [d-default
-- ]D jumps to the last diagnostic in the buffer. ]D-default
-- [D jumps to the first diagnostic in the buffer. [D-default
-- <C-w>d shows diagnostic at cursor in a floating window. CTRL-W_d-default

vim.lsp.enable("ts_ls")

-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set("n", "<localleader>e", vim.diagnostic.open_float)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<localleader>q", vim.diagnostic.setloclist)
--
-- -- Use LspAttach autocommand to only map the following keys
-- -- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- 	callback = function(ev)
-- 		-- Buffer local mappings.
-- 		-- See `:help vim.lsp.*` for documentation on any of the below functions
-- 		local opts = { buffer = ev.buf }
-- 		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
-- 		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- 		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
-- 		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
-- 		vim.keymap.set("n", "<localleader>wa", vim.lsp.buf.add_workspace_folder, opts)
-- 		vim.keymap.set("n", "<localleader>wr", vim.lsp.buf.remove_workspace_folder, opts)
-- 		vim.keymap.set("n", "<localleader>wl", function()
-- 			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 		end, opts)
-- 		vim.keymap.set("n", "<localleader>D", vim.lsp.buf.type_definition, opts)
-- 		vim.keymap.set("n", "<localleader>rn", vim.lsp.buf.rename, opts)
-- 		vim.keymap.set({ "n", "v" }, "<localleader>ca", vim.lsp.buf.code_action, opts)
-- 		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
-- 	end,
-- })

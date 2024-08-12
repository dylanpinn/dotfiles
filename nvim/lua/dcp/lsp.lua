-- Create an event handler for the FileType autocommand
vim.api.nvim_create_autocmd("FileType", {
	-- This handler will fire when the buffer's 'filetype' is "lua"
	pattern = "lua",
	callback = function(_args)
		vim.lsp.start({
			name = "lua-language-server",
			cmd = { "lua-language-server" },

			-- TODO: Update this comment.
			-- Set the "root directory" to the parent directory of the file in the
			-- current buffer (`args.buf`) that contains either a "setup.py" or a
			-- "pyproject.toml" file. Files that share a root directory will reuse
			-- the connection to the same LSP server.
			-- root_dir = vim.fs.root(args.buf, { "setup.py", "pyproject.toml" }),
			root_dir = vim.fs.root(0, {
				".luarc.json",
				".luarc.jsonc",
				".luacheckrc",
				".stylua.toml",
				"stylua.toml",
				"selene.toml",
				"selene.yml",
				".git",
			}),

			on_init = function(client)
				local path = vim.tbl_get(client, "workspace_folders", 1, "name")
				if not path then
					vim.print("no workspace")
					return
				end
				client.settings = vim.tbl_deep_extend("force", client.settings, {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								-- Depending on the usage, you might want to add additional paths here.
								-- "${3rd}/luv/library"
								-- "${3rd}/busted/library",
							},
							-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
							-- library = vim.api.nvim_get_runtime_file("", true)
						},
					},
				})
			end,
		})
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			vim.print("no client")
			return
		end
		if client.supports_method("textDocument/implementation") then
			-- Create a keymap for vim.lsp.buf.implementation
			vim.api.nvim_buf_set_keymap(args.buf, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {
				noremap = true,
				silent = true,
			})
		end

		if client.supports_method("textDocument/completion") then
			-- Enable auto-completion
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
		end

		if client.supports_method("textDocument/formatting") then
			-- Format the current buffer on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end,
			})
		end

		if client.supports_method("textDocument/formatting") then
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					-- Enable signs
					signs = true,
				})
		end
	end,
})

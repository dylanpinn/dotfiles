return {
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua", -- lazy load when invoked.
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons", "MeanderingProgrammer/render-markdown.nvim" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
		keys = {
			{ "<leader><space>", "<Cmd>FzfLua files<CR>" }, -- find or fd on a path.
			{ "<leader>/", "<Cmd>FzfLua live_grep<CR>" }, -- live grep current project.
			{ "<leader>:", "<Cmd>FzfLua command_history<CR>" }, -- command history.
			{ "<leader>b", "<Cmd>FzfLua buffers<CR>" }, -- open buffers.
			{ "<F1>", "<Cmd>FzfLua helptags<CR>" }, -- help tags.

			{ "<C-\\>", "<Cmd>FzfLua buffers<CR>" }, -- open buffers.
			{ "<C-k>", "<Cmd>FzfLua builtin<CR>" }, -- fzf-lua builtin commands
			{ "<C-p>", "<Cmd>FzfLua files<CR>" }, -- find or fd on a path.
			{ "<C-l>", "<Cmd>FzfLua live_grep_glob<CR>" }, -- live_grep with rg --glob support.
			{ "<C-g>", "<Cmd>FzfLua grep_project<CR>" }, -- search all project files.
			-- vim.api.nvim_set_keymap("n", "<C-\\>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
			-- vim.api.nvim_set_keymap("n", "<C-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
			-- vim.api.nvim_set_keymap("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
			-- vim.api.nvim_set_keymap("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
			-- vim.api.nvim_set_keymap("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
			-- vim.api.nvim_set_keymap("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})
		},
	},
}

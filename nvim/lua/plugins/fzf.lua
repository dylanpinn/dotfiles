return {
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua", -- lazy load when invoked.
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
		keys = {
			{ "<leader><space>", "<Cmd>FzfLua files<CR>" },
			{ "<leader>/", "<Cmd>FzfLua live_grep<CR>" },
			{ "<leader>:", "<Cmd>FzfLua command_history<CR>" },
			{ "<leader>/", "<Cmd>FzfLua buffers<CR>" },
			{ "<F1>", "<Cmd>FzfLua helptags<CR>" },
		},
	},
}

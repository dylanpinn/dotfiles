-- Set 'background' option based on on $TERMCS.

local termcs = os.getenv("TERMCS") or "dark"
local function set_bg()
	if termcs == "dark" then
		vim.api.nvim_set_option_value("background", "dark", {})
		vim.cmd("colorscheme catppuccin-mocha")
	else
		vim.api.nvim_set_option_value("background", "light", {})
		vim.cmd("colorscheme catppuccin-latte")
	end
end

vim.api.nvim_create_user_command("SetBG", set_bg, {})
vim.cmd.SetBG()

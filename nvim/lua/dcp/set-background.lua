-- Set 'background' option based on on $TERMCS.

local termcs = os.getenv("TERMCS") or "dark"
local function set_bg()
	vim.opt.background = termcs
end

vim.api.nvim_create_user_command("SetBG", set_bg, {})
vim.cmd.SetBG()

-- The majority of my custom configuration lies within this module. The order that these modules are loaded is important.

--require("dcp.set-background")
require("dcp.keymaps")
require("dcp.options")
--require("dcp.packages")

vim.cmd.colorscheme("morning")

-- Use ripgrep as built-in search tool, this is quicker than grep, has better interface and automatically ignores correct files/directories.
if vim.fn.executable('ag') then
	vim.o.grepprg = 'rg --vimgrep --no-heading'
	vim.opt.grepformat:append { '%f:%l:%c:%m' }
end

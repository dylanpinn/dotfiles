-- Vim includes defaults for comments and path that date back to its history as
-- a mainly C development environment.  Removing these values allows us to use
-- filetype plugins to set them as needed.
--
vim.opt.comments = ""
vim.opt.commentstring = ""
vim.opt.define = ""
vim.opt.include = ""
vim.opt.path:remove({ "/usr/include" })

-- Use ripgrep for searching files rather than grep(1).
-- rg is faster and automatically excludes ignored files.
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.opt.grepformat:prepend({ "%f:%l:%c:%m" })

-- Configure the wildmenu to ignore a list of patterns for file and directory
-- command line completion.  Files and directories matching any of these
-- patterns won't be presented as candidates for tab completion on the command
-- line.
--
-- The list combines a mixture of binary files that would not contain text and
-- therefore would not want to edit, and directories that contain generated
-- files that won't want to be edited either.
--
vim.opt.wildignore:append({ "*/node_modules/*" }) -- ignore dependency directories.

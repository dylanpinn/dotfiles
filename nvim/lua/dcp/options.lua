-- Vim includes defaults for comments and path that date back to its history as
-- a mainly C development environment.  Removing these values allows us to use
-- filetype plugins to set them as needed.
--
vim.opt.comments = ""
vim.opt.commentstring = ""
vim.opt.define = ""
vim.opt.include = ""
vim.opt.path:remove({ "/usr/include" })

-- The next set of options relate to blocks/lines of text and how they are
-- displayed across multiple lines.

-- When soft-wraps are enabled with 'wrap' option, then break the line between
-- words, rather than within them.
--
vim.opt.linebreak = true

-- When wrapping a line using soft-wraps, highlight that it has been wrapped by
-- inserting a leading string - "> ".
--
vim.opt.showbreak = "> "

-- When wrapping a line, if that line is indented then the wrapped line is
-- also indented the same amount.
--
vim.opt.breakindent = true

-- Automatic text wrapping options using flags in the 'formatoptions' option
-- begin here.

-- Don't break a line after a one-letter word like "I" or "a".
--
vim.opt.formatoptions:append({ 1 })

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

-- Use ripgrep rather than the inbuilt grep command for all :grep searches.
-- Ripgrep is faster than most other alternatives, recursive search by default,
-- and won't include files/directories ignored by .gitignore.
--
if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.opt.grepformat:append("%f:%l:%c:%m")
end

-- This file contains all of the options that are set using vim.opt.* expressions. Currently the options in this file
-- are grouped by a loose context, e.g. comments, text wrappign, status line, etc. Unsure if this should be changed to
-- be alphabetic instead.
--

-- Vim includes defaults for comments and path that date back to its history as
-- a mainly C development environment.  Removing these values allows us to use
-- filetype plugins to set them as needed.
--
vim.opt.comments = ""
vim.opt.commentstring = ""
vim.opt.define = ""
vim.opt.include = ""
vim.opt.path:remove({ "/usr/include" })

-- Add ** to the path to allow a better default :find experience by searching
-- sub-directories of the CWD.
vim.opt.path:append({ "**" })

-- Use ripgrep for searching files rather than grep(1).
-- rg is faster and automatically excludes ignored files.
if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.opt.grepformat:prepend({ "%f:%l:%c:%m" })
end

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

-- Use basic statusline, using this rather than an external plugin to do this as this currently fits my needs and
-- doesn't add extra complexity.
--
-- Taken from https://www.vi-improved.org/recommendations/
vim.opt.statusline = "%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]"
--                   | | | | |  |   |      |  |     |    |
--                   | | | | |  |   |      |  |     |    +-- current column
--                   | | | | |  |   |      |  |     +-- current line
--                   | | | | |  |   |      |  +-- current % into file
--                   | | | | |  |   |      +-- current syntax
--                   | | | | |  |   +-- current fileformat
--                   | | | | |  +-- number of lines
--                   | | | | +-- preview flag in square brackets
--                   | | | +-- help flag in square brackets
--                   | | +-- readonly flag in square brackets
--                   | +-- rodified flag in square brackets
--                   +-- full path to file in the buffer

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

-- Configure wildmenu to show the full list of matches while also completing the first full match.
vim.opt.wildmode = "list:full"

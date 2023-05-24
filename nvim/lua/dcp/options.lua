-- This file contains all of the options that are set using vim.opt.* expressions. The options in this file are sorted
-- alphabetically.
--

-- Enable automatic backups before overwriting a file and leave it around after
-- the file has been written. These files are kept in a cache directory by defualt in Neovim.
--
vim.opt.backup = true

-- When wrapping a line, if that line is indented then the wrapped line is also indented the same amount.
--
vim.opt.breakindent = true

-- Neovim includes defaults for comments that date back to its history as a mainly C development environment.
-- Removing these values allows us to use filetype plugins to set them as needed.
--
vim.opt.comments = ""

-- Neovim's defaults for macro definitions, which are used for include-search, defaults that also date back to its
-- history as a mainly C development environment. Removing these values allows ut to use filetype plugins to set them
-- as needed.
--
vim.opt.define = ""
--
-- Automatic text wrapping options using flags in the 'formatoptions' option
-- begin here.

-- Don't break a line after a one-letter word like "I" or "a".
--
vim.opt.formatoptions:append({ 1 })


-- Use ripgrep for searching files rather than grep(1).
-- rg is faster and automatically excludes ignored files.
--
if vim.fn.executable("rg") == 1 then
  vim.opt.grepformat:prepend({ "%f:%l:%c:%m" })
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end

-- Neovim's defaults for finding include commands, defaults that also date back to its history as a mainly C development
-- environment. Removing these values allows ut to use filetype plugins to set them as needed.
--
vim.opt.include = ""
--
-- When soft-wraps are enabled with 'wrap' option, then break the line between words, rather than within them.
--
vim.opt.linebreak = true

-- Add ** to the path to allow a better default :find experience by searching sub-directories of the CWD.
--
vim.opt.path:append({ "**" })

-- Neovim includes defaults for path that date back to its history as
-- a mainly C development environment.  Removing these values allows us to use
-- filetype plugins to set them as needed.
--
vim.opt.path:remove({ "/usr/include" })

-- When wrapping a line using soft-wraps, highlight that it has been wrapped by
-- inserting a leading string - "> ".
--
vim.opt.showbreak = "> "

-- Use basic statusline, using this rather than an external plugin to do this as this currently fits my needs and
-- doesn't add extra complexity.
--
-- Taken from https://www.vi-improved.org/recommendations/
--
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

-- Keep track of undo history for files between sessions.  This ensures that
-- undo and redo are available between Vim invocations.  These files are kept
-- in a cache directory.
--
vim.opt.undofile = true


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
--
vim.opt.wildmode = "list:full"

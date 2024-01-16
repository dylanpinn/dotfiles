-- This file contains all of the options that are set using vim.opt.* expressions. The options in this file are sorted
-- alphabetically.
--

-- Enable automatic backups before overwriting a file and leave it around after the file has been written. These files
-- are kept in a cache directory by defualt in Neovim.
--
vim.opt.backup = true

-- By default Neovim will look to save backup files in the same directory as the file.  It has a fallback to a cache
-- directory so removing the first option will use that instead.
--
vim.opt.backupdir:remove({ "." })

-- When wrapping a line, if that line is indented then the wrapped line is also indented the same amount.
--
vim.opt.breakindent = true

-- Neovim includes defaults for comments that date back to its history as a mainly C development environment. Removing
-- these values allows us to use filetype plugins to set them as needed.
--
vim.opt.comments = ""

-- Use two spaces to end a sentence. This helps improve readability using monospaced fonts.  This also helps vim work
-- with sentence objects for the purpose of the 's' text objects, the '(' and ')' sentence motions, and formatting with
-- the 'gq' command must now be separated by two spaces.
--
-- See https://stevelosh.com/blog/2012/10/why-i-two-space/
--
vim.opt.cpoptions:append("J")

-- Neovim's defaults for macro definitions, which are used for include-search, defaults that also date back to its
-- history as a mainly C development environment. Removing these values allows ut to use filetype plugins to set them as
-- needed.
--
vim.opt.define = ""
--
-- Automatic text wrapping options using flags in the 'formatoptions' option begin here.

-- Don't break a line after a one-letter word like "I" or "a".
--
vim.opt.formatoptions:append({ 1 })

-- Because we are using two spaces for ending sentences. Vim can determine if the space after an abbreviation such as
-- "Mr. Pinn" is the end of the sentence or not and then determine if it should be split on it. The 'p' flag makes this
-- possible.
--
vim.opt.formatoptions:append({ "p" })

-- Use ripgrep for searching files rather than grep(1). rg is faster and automatically excludes ignored files.
--
if vim.fn.executable("rg") == 1 then
	vim.opt.grepformat:prepend({ "%f:%l:%c:%m" })
	vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end

-- Ignore case when searching.
--
vim.opt.ignorecase = true

-- Neovim's defaults for finding include commands, defaults that also date back to its history as a mainly C development
-- environment. Removing these values allows ut to use filetype plugins to set them as needed.
--
vim.opt.include = ""
--
-- When soft-wraps are enabled with 'wrap' option, then break the line between words, rather than within them.
--
vim.opt.linebreak = true

-- Neovim includes defaults for path that date back to its history as a mainly C development environment.  Removing
-- these values allows us to use filetype plugins to set them as needed.
--
vim.opt.path:remove({ "/usr/include" })

-- When wrapping a line using soft-wraps, highlight that it has been wrapped by inserting a leading string - "> ".
--
vim.opt.showbreak = "> "

-- Becuase we are ignoring case when searching, if the search contains upper-case characters then use that rather than
-- ignoring it.
--
vim.opt.smartcase = true

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

-- Keep track of undo history for files between sessions.  This ensures that undo and redo are available between Vim
-- invocations.  These files are kept in a cache directory.
--
vim.opt.undofile = true

-- Configure the wildmenu to ignore a list of patterns for file and directory command line completion.  Files and
-- directories matching any of these patterns won't be presented as candidates for tab completion on the command line.
--
-- The list combines a mixture of binary files that would not contain text and therefore would not want to edit, and
-- directories that contain generated files that won't want to be edited either.
--
vim.opt.wildignore:append({ "*/node_modules/*" }) -- ignore dependency directories.

-- Configure wildmenu to show the full list of matches while also completing the first full match.
--
vim.opt.wildmode = "list:full"

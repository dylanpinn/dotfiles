-- Use prettier to format Markdown files.
vim.opt_local.formatprg = "npx prettier --stdin-filepath %"

-- Unfold all by start.
vim.opt_local.foldlevel = 99

-- Format whole file using Prettier.
-- There are issues using formatprg, so running this as a separate command
-- seems the best solution that doesn't involve a new plugin.
vim.keymap.set("n", "<LocalLeader>f", ":silent %!npx prettier --stdin-filepath %<CR>")

-- Use system word list for completion with CTRL-P or CTRL-N.
-- setlocal complete+=k/usr/share/dict/words
vim.opt_local.complete.append({ "k/usr/share/dict/words" })

-- Use lazy.nvim as a package manager rather than the the built in package
-- manager or other plugins that wrap it such as Packer or paq.
-- The reason for this is due to significant increase of start up time compared
-- to paq and being able to define plugins via a lua module.

-- Install lazy.nvim and add to the runtimepath.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy to load plugins from the "plugins" module.
require("lazy").setup("plugins", {
  performance = {
    rtp = {
      -- Disable built in plugins that are not used, this speeds up startup time.
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
  -- Use unicode characters for icons rather than a Nerd Font.
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
    },
  },
})

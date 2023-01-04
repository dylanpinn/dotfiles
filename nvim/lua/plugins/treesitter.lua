return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      vim.cmd("TSUpdate")
    end,
  },
}

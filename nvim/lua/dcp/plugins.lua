return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      vim.cmd("TSUpdate")
    end,
  },
  "jayp0521/mason-null-ls.nvim",
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {"folke/tokyonight.nvim", lazy=false},
  { "neovim/nvim-lspconfig" },
}

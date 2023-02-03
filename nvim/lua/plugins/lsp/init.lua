return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        sumneko_lua = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique
            -- identifier
            telemetry = {
              enable = false,
            },
          },
        },
      }
    },
    config = function(plugin, opts)
      -- TODO: Load on_attach from lugins.lsp.keymaps

      local servers = opts.servers

      local function setup(server)
        local server_opts = servers[server] or {}

        require("lspconfig")[server].setup(server_opts)
      end

      require("mason-lspconfig").setup_handlers({ setup })
    end,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      {
        "jay-babu/mason-null-ls.nvim",
        opts = {
          ensure_installed = nil,
          automatic_installation = true,
          automatic_setup = false,
        },
        setup = function(plugin, opts)
          -- require("mason-null-ls").setup(opts)
          require("mason-null-ls").setup({
            ensure_installed = nil,
            automatic_installation = true,
            automatic_setup = false,
          })
        end,
      },
    },
    opts = {},
    setup = function(plugin, opts)
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Code Actions
          null_ls.builtins.code_actions.eslint_d,
          -- Diagnostics
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.luacheck,
          -- Formatting
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
        },
      })
    end
  },

  -- cmdline tools and LSP servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "luacheck",
        "stylua",
      },
    },
    config = function(plugin, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
}

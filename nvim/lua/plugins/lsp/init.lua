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
      "nvim-lua/plenary.nvim",
      {
        "jay-babu/mason-null-ls.nvim",
        opts = {
          ensure_installed = {
            "luacheck",
            "stylua",
          },
          automatic_installation = true,
          automatic_setup = false,
        },
        setup = function(plugin, opts)
          -- require("mason-null-ls").setup(opts)
          require("mason-null-ls").setup({
            ensure_installed = nil,
            automatic_installation = false,
            automatic_setup = true,
          })
        end,
      },
    },
    opts = {},
    setup = function(plugin, opts)
      local null_ls = require("null-ls")

      require 'mason-null-ls'.setup_handlers {
        function(source_name, methods)
          -- all sources with no handler get passed here

          -- To keep the original functionality of `automatic_setup = true`,
          -- please add the below.
          require("mason-null-ls.automatic_setup")(source_name, methods)
        end,
        stylua = function(source_name, methods)
          null_ls.register(null_ls.builtins.formatting.stylua)
        end,
      }
      null_ls.setup()
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

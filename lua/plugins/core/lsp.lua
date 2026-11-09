local SERVERS = {
  lua_ls = {
    settings = {
      Lua = {
        hint = {
          enable = true,
          arrayIndex = 'Disable',
        },
      },
    },
  },
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        inlayHints = {
          typeHints = { enable = true },
          parameterHints = { enable = true },
          chainingHints = { enable = true },
          closingBraceHints = { enable = true },
        },
      },
    },
  },
  ts_ls = {},
  cssls = {},
  pyright = {},
  ruff = {},
}

return {
  { 'williamboman/mason.nvim', config = true },

  {
    'williamboman/mason-lspconfig.nvim',
    config = true,
    opts = {
      ensure_installed = vim.tbl_keys(SERVERS),
      automatic_installation = true,
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      diagnostics = { virtual_text = { prefix = 'icons' } },
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = false,
          },
        },
      },

      inlay_hints = { enabled = false },
    },

    config = function()
      for server, server_opts in pairs(SERVERS) do
        vim.lsp.config(server, server_opts)
        vim.lsp.enable(server)
      end
    end,

    dependencies = {
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
    },
  },
}

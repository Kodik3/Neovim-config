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
}

return {
  -- Mason: менеджер LSP серверов
  {
    'williamboman/mason.nvim',
    config = true,
    ensure_installed = {
      'stylua',
      'prettier',
      'shfmt',
      'eslint_d',
      'luacheck',
      'shellcheck',
      'ruff',
    },
  },

  -- Mason-LSPConfig: связывает Mason с nvim-lspconfig
  {
    'williamboman/mason-lspconfig.nvim',
    config = true,
    opts = {
      ensure_installed = vim.tbl_keys(SERVERS),
      automatic_installation = true,
    },
  },

  -- LSP Config: настройка самих серверов
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
      servers = SERVERS,
    },
    config = function(_, opts)
      for server, server_opts in pairs(opts.servers) do
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

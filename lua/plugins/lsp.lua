local SERVERS = {
  lua_ls = {},
  rust_analyzer = {},
  ts_ls = {},
  cssls = {},
  tailwindcss = {},
  pyright = {},
}

return {
  -- Mason: менеджер LSP серверов
  {
    'williamboman/mason.nvim',
    config = true,
    ensure_installed = {
      "stylua",
      "prettier",
      "shfmt",
      "black",
      "eslint_d",
      "luacheck",
      "pylint",
      "shellcheck",
    }
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
      inlay_hints = { enabled = false },
      servers = SERVERS,
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")

      for server, server_opts in pairs(opts.servers) do
        lspconfig[server].setup(server_opts)
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

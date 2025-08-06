return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
  },

  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',

    opts = {
      keymap = { preset = 'default' },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = true,
  },

  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    opts = {
      autotag = {
        enable = true,
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      }
    },
    config = function(_, opts)
      require("nvim-ts-autotag").setup(opts.autotag)
    end,
  },
}

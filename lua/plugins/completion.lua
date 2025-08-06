return {
  -- Авто-дополнения с поддержкой LSP ( https://github.com/Saghen/blink.cmp )
  {
    'saghen/blink.cmp',
    enabled = true,
    lazy = false,
    build = 'cargo build --release',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'Exafunction/windsurf.nvim'
    },
    opts = {
      keymap = { preset = 'default' },
      fuzzy = { implementation = "lua" },
      cmdline = { enabled = false },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
        providers = {
          codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
        },
      },

      completion = {
        menu = {
          border = 'rounded',
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
        },
        documentation = {
          window = {
            border = 'rounded',
          },
          auto_show = true,
          auto_show_delay_ms = 500
        },
      },
    },
  },
  -- Авто-сопряжение ( https://github.com/windwp/nvim-autopairs )
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = true,
  },
  
  -- Автоматического закрытие/переименование HTML-тегов
  -- ( https://github.com/windwp/nvim-ts-autotag )
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    opts = {
      enable = true,
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
    }
  },
}

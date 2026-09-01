return {
  -- Авто-дополнения с поддержкой LSP ( https://github.com/Saghen/blink.cmp )
  {
    'saghen/blink.cmp',
    lazy = false,

    dependencies = {
      'rafamadriz/friendly-snippets',
      'Exafunction/windsurf.nvim',
    },

    version = '*',

    opts = {
      keymap = { preset = 'default' },
      fuzzy = { implementation = "lua" },
      cmdline = { enabled = false },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
        providers = {
          codeium = {
            name = 'Codeium',
            module = 'codeium.blink',
            async = true
          },
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
          auto_show_delay_ms = 500,
        },
        ghost_text = {
          enabled = false,
        }
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
      close = true,
      rename = true,
      close_on_slash = false,
    }
  },
}

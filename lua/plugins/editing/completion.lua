return {
  -- Авто-дополнения с поддержкой LSP ( https://github.com/Saghen/blink.cmp )
  {
    'saghen/blink.cmp',
    lazy = false,
    version = '1.*',

    dependencies = { 'rafamadriz/friendly-snippets' },

    opts = {
      keymap = { preset = 'default' },
      cmdline = { enabled = false },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {
        menu = {
          scrollbar = false,
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
        },
        documentation = {
          treesitter_highlighting = false,
        },
        ghost_text = {
          enabled = false,
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
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        per_filetype = {
          ['html'] = {
            enable_close = false,
          },
        },
      })
    end,
  },
}

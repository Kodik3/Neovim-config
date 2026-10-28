return {
  -- Авто-дополнения с поддержкой LSP ( https://github.com/Saghen/blink.cmp )
  {
    'saghen/blink.cmp',
    lazy = false,

    dependencies = {
      'rafamadriz/friendly-snippets',
      'Exafunction/windsurf.nvim',
    },

    version = '1.*',

    opts = {
      keymap = { preset = 'default' },
      cmdline = { enabled = false },

      sources = {
        default = function()
          if vim.bo.filetype == '' then
            return {}
          end

          local sources = { 'lsp', 'path', 'snippets', 'buffer' }

          local line = vim.api.nvim_get_current_line()
          local col = vim.api.nvim_win_get_cursor(0)[2]
          local before_cursor = line:sub(1, col)

          if
              not line:match('^%s*import%s')
              and not before_cursor:find('[А-яЁё]')
          then
            table.insert(sources, 'codeium')
          end

          return sources
        end,
        providers = {
          codeium = {
            name = 'Codeium',
            module = 'codeium.blink',
            async = true,
          },
        },
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

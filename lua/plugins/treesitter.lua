return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
      local treesitter = require('nvim-treesitter.configs')

      treesitter.setup({
        highlight = { enable = true },
        indent = { enable = true },
        autotage = { enable = true },

        sync_install = false,
        auto_install = true,

        ensure_installed = {
          'lua', 'html', 'css', 'javascript', 'typescript', 'tsx', 'json', 'python', 'http',
          'markdown', 'markdown_inline', 'vim', 'vimdoc', 'dockerfile', 'gitignore', 'c',
          'svelte', 'php',
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<CR>',       -- начать выделение
            node_incremental = '<TAB>',    -- расширить до следующего узла
            node_decremental = '<S-TAB>',  -- сузить выделение
            scope_incremental = '<CR>',    -- расширить до блока (например, функции)
          },
        },
      })
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    ft = {
      'html', 'xml', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte'
    },
    config = function()
      require('nvim-ts-autotag').setup({
        enable_close = true,           -- Автоматическое закрытие тегов
        enable_rename = true,          -- Автоматическое переименование пар тегов
        enable_close_on_slash = false, -- Не закрывать автоматически после ввода `</`
        per_filetype = {
          ['html'] = {
            enable_close = false,      -- Отключаем автозакрытие для html
          },
          ['typescriptreact'] = {
            enable_close = true,       -- Явно включаем для tsx (react)
          },
        },
      })
    end,
  },
}

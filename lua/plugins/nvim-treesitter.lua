-- Подсветка кода
local LANGUAGES = {
  'html', 'css', 'javascript', 'typescript', 'tsx',
  'python', 'dockerfile', 'php', 'rust',
}

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    auto_install = true,
    ensure_installed = vim.list_extend({
      'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline'
    }, LANGUAGES),
    highlight = {
      enable = true,
      disable = { 'qf' },
    },
    fold = {
      enabled = true,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',   -- начать выделение
        node_incremental = '<C-space>', -- расширить до следующего узла
        scope_incremental = false,      -- расширить до блока (например, функции)
        node_decremental = "<bs>",      -- сузить выделение
      },
    },
    textobjects = {
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
        },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["]a"] = "@parameter.inner",
      },
      swap_previous = {
        ["[a"] = "@parameter.inner",
      },
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
      },
      include_surrounding_whitespace = true,
    },
  }
}

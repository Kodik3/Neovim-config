-- Git плагины
return {
  -- Визуализация и разрешение конфликтов ( https://github.com/akinsho/git-conflict.nvim )
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true,
    keys = { 
      { '<leader>go', '<Plug>(git-conflict-ours)', desc = 'Conflict: [O]urs' },
      { '<leader>gt', '<Plug>(git-conflict-theirs)', desc = 'Conflict: [T]heirs' },
      { '<leader>gb', '<Plug>(git-conflict-both)', desc = 'Conflict: [B]oth' },
      { '<leader>gn', '<Plug>(git-conflict-none)', desc = 'Conflict: [N]one' },
      { '[g', '<Plug>(git-conflict-prev-conflict)', desc = 'Conflict: Previous' },
      { ']g', '<Plug>(git-conflict-next-conflict)', desc = 'Conflict: Next' },
    },
  },

  -- Git-индикация ( https://github.com/lewis6991/gitsigns.nvim )
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        word_diff = false,
        signs_staged_enable = true,
        signcolumn = true,
        numhl = false,
        linehl = false,
        watch_gitdir = {
          follow_files = true,
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = '<author>, <author_time:%R>',
        preview_config = {
          border = 'none',
          style = 'minimal',
        },
      })
    end,
  },

  -- Git CLI ( https://github.com/tpope/vim-fugitive )
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gg', vim.cmd.Git)

      local myFugitive = vim.api.nvim_create_augroup('myFugitive', {})
      local autocmd = vim.api.nvim_create_autocmd

      autocmd('BufWinEnter', {
        group = myFugitive,
        pattern = '*',
        callback = function()
          if vim.bo.ft ~= 'fugitive' then
            return
          end

          local bufnr = vim.api.nvim_get_current_buf()
          local opts = { buffer = bufnr, remap = false }

          vim.keymap.set('n', '<leader>P', function()
            vim.cmd.Git('push')
          end, opts)

          -- NOTE: rebase always
          vim.keymap.set('n', '<leader>p', function()
            vim.cmd.Git({ 'pull', '--rebase' })
          end, opts)

          -- NOTE: easy set up branch that wasn't setup properly
          vim.keymap.set('n', '<leader>t', ':Git push -u origin ', opts)
        end,
      })
    end,
  },
}
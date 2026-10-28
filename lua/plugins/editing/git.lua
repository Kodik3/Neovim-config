return {
  -- Git CLI ( https://github.com/tpope/vim-fugitive )
  { 'tpope/vim-fugitive' },

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
}

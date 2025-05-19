return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup({
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        line = 'gcc',
        block = 'gbc',
      },
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
      },
      mappings = {
        basic = true,
        extra = true,
      },
    })

    local api = require('Comment.api')

    vim.keymap.set('n', '<C-_>', function()
      api.toggle.linewise.current()
    end, { desc = 'Toggle comment line (Ctrl+/)' })

    vim.keymap.set('v', '<C-_>', function()
      local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
      vim.api.nvim_feedkeys(esc, 'x', false)
      api.toggle.linewise(vim.fn.visualmode())
    end, { desc = 'Toggle comment selection (Ctrl+/)' })

    vim.keymap.set('i', '<C-_>', function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'x', false)
      require('Comment.api').toggle.linewise.current()
      vim.api.nvim_feedkeys('A', 'n', false)
    end, { desc = 'Toggle comment from insert mode' })

  end
}

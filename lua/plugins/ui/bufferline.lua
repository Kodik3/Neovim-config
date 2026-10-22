return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',

  keys = {
    { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next tab' },
    { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Prev tab' },
    { '<leader>bd', '<Cmd>bdelete<CR>', desc = 'Close current buffer' },
  },

  config = function()
    vim.opt.termguicolors = true

    require('bufferline').setup({
      options = {
        numbers = 'ordinal',
        diagnostics = 'nvim_lsp',

        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
      },
    })
  end,
}

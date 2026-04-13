-- https://github.com/brenoprata10/nvim-highlight-colors
return {
  'brenoprata10/nvim-highlight-colors',
  enabled = true,

  event = { 'BufReadPost', 'BufNewFile' },

  opts = {
    render = 'background',
    enable_named_colors = true,
    enable_tailwind = true,
  },
}
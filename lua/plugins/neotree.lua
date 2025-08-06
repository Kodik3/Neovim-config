-- Просмотр файловой системы и других деревьев.
return {
  'nvim-neo-tree/neo-tree.nvim',
  enabled = true,
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  opts={
    enable_modified_markers = true,
    window = {
      position = 'right',
      width = 25,
    },
  },
  keys = {
    { '<leader>e', ':Neotree toggle<CR>', desc = 'Показать/скрыть дерево' },
    { '<leader>o', ':Neotree git_status<CR>', desc = 'Git статус дерева' },
  },
}
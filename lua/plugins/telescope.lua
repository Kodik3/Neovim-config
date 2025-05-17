-- Расширяемый нечеткий искатель по спискам
return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Поиск файлов' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>',  desc = 'Поиск по содержимому' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>',    desc = 'Поиск буферов' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>',  desc = 'Поиск справки' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.load_extension('fzf')

    telescope.setup({
      defaults = {
        path_display = { 'smart' },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
    })
  end,
}
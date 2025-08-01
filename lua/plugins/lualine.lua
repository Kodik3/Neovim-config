local wakatime = require('functions.wakatime')

local COLORS = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local MODE_COLOR_MAP = {
  n = COLORS.red,
  i = COLORS.green,
  v = COLORS.blue,
  [''] = COLORS.blue,
  V = COLORS.blue,
  c = COLORS.magenta,
  no = COLORS.red,
  s = COLORS.orange,
  S = COLORS.orange,
  [''] = COLORS.orange,
  ic = COLORS.yellow,
  R = COLORS.violet,
  Rv = COLORS.violet,
  cv = COLORS.red,
  ce = COLORS.red,
  r = COLORS.cyan,
  rm = COLORS.cyan,
  ['r?'] = COLORS.cyan,
  ['!'] = COLORS.red,
  t = COLORS.red,
}

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      enabled = true,
      options = {
        section_separators = '',
        component_separators = '',
        theme='auto',
        disabled_filetypes = {
          'neo-tree',
          'undotree',
          'sagaoutline',
          'diff',
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {
          {
            -- компонент режима
            function() return '▊' end,
            color = function()
              -- автоматическое изменение цвета в соответствии с режимом neovim
              return { fg = MODE_COLOR_MAP[vim.fn.mode()] }
            end,
            padding = { right = 1 },
          },
          {
            "branch",
            icon = "",
            color = { fg = COLORS.violet, gui = "bold" },
          },
          
          {
            wakatime,
            cond = function() return vim.g["loaded_wakatime"] == 1 end,
            icon = "󱑆",
            color = { fg = COLORS.cyan },
          },
          {
            'diff',
            symbols = { added = '+', modified = '~', removed = '-' },
            diff_color = {
              added = { fg = COLORS.green },
              modified = { fg = COLORS.orange },
              removed = { fg = COLORS.red },
            },
            cond = conditions.hide_in_width,
          },
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
              error = { fg = COLORS.red },
              warn = { fg = COLORS.yellow },
              info = { fg = COLORS.cyan },
            },
          },
        },
        lualine_x = {
          {
            -- Lsp server name .
            function()
              local ft = vim.bo.filetype
              for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
                if not vim.tbl_contains({ "null-ls", "copilot" }, client.name) then
                  return string.format("%s ( %s)", ft, client.name)
                end
              end
              return ft
            end,
            color = { fg = '#ffffff' },
          },
          {
            'encoding',
            fmt = string.upper,
            cond = conditions.hide_in_width,
            color = { fg = COLORS.green },
          },
          {
            'location',
            padding = { left = -1, right = -5 }
          },
          { 'progress', color = { fg = COLORS.fg } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    })
  end
}

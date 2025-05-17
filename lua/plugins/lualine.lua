-- Cтатус-бар
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      enabled = true,
      options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '',
      },
    })
  end
}

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Подсветка скопированного текста',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Форматирование файла перед сохранением',
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd({ 'UIEnter', 'ColorScheme' }, {
  desc = 'Синхронизация цвета фона терминала с цветом фона Neovim',
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
    if not normal.bg then
      return
    end
    io.write(string.format('\027]11;#%06x\027\\', normal.bg))
  end,
})

vim.api.nvim_create_autocmd('UILeave', {
  desc = 'Сброс цвета фона терминала при выходе из Neovim',
  callback = function()
    io.write('\027]111\027\\')
  end,
})

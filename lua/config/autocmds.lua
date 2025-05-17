vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function() vim.highlight.on_yank() end,
})

-- Пример: автоформат при сохранении
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
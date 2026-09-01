vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

local LANGUAGES = {
  'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline',

  'html', 'css', 'javascript', 'typescript', 'tsx', 'python',
  'dockerfile', 'rust',
}

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    require('nvim-treesitter').install(LANGUAGES)

    vim.api.nvim_create_autocmd('FileType', {
      desc = 'Запуск tree-sitter',
      pattern = LANGUAGES,
      callback = function(args)
        vim.treesitter.start(args.buf)
      end
    })
  end
}

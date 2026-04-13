local prettier = { 'prettier' }

return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
    },
    default_format_opts = {
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = prettier,
      typescript = prettier,
      javascriptreact = prettier,
      typescriptreact = prettier,
      json = prettier,
      css = prettier,
      html = prettier,
      sh = { 'shfmt' },
      rust = { 'rustfmt' },
      python = function(bufnr)
        if require('conform').get_formatter_info('ruff_format', bufnr).available then
          return { 'ruff_fix', 'ruff_format' }
        else
          return { 'isort', 'black' }
        end
      end,
    },
  },
}
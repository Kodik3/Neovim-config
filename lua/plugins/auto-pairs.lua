return {
  'windwp/nvim-autopairs',
  event = { 'InsertEnter' },
  dependencies = {
    'hrsh7th/nvim-cmp',
  },
  config = function()
    local autopairs = require('nvim-autopairs')

    autopairs.setup({
      check_ts = true, -- включить поддержку treesitter
      ts_config = {
        lua = { 'string' }, -- не добавлять пары внутри строк в lua
        javascript = { 'template_string' }, -- не добавлять пары внутри template_string в javascript
        java = false, -- не использовать treesitter для java
      },
    })
    -- импортируем функционал автопар для работы с автодополнением
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    -- импортируем плагин автодополнения nvim-cmp
    local cmp = require('cmp')
    -- делаем автопары и автодополнение совместимыми
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
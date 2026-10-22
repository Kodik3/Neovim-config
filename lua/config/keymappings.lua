local map = vim.keymap.set

map({ 'i', 's' }, '<S-Tab>', '<C-d>', { desc = 'Shift-Tab action' })
map('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Выход в normal mode (Terminal)' })
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Очистка подсветки поиска' })

-- Clipboard
map('v', '<C-c>', '"+y', { desc = 'Копировать выделенное' })
map('n', '<C-v>', '"+p', { desc = 'Вставить после курсора' })
map('i', '<C-v>', '<C-r>+', { desc = 'Вставить в текущее место' })
map('c', '<C-v>', '<C-r>+', { desc = 'Вставить в командной строке' })

-- File editing
map('n', '<C-a>', 'ggVG', { desc = 'Выделить весь файл' })
map('n', '<C-s>', '<cmd>w<CR>', { desc = 'Сохранить файл' })

-- Tabs
map('n', 'te', '<cmd>tabedit<CR>', { desc = 'Новая вкладка' })

-- Exit / Quit
map('n', '<leader>qq', '<cmd>qa<CR>', { desc = 'Выйти из Neovim' })

-- Switch windows
map('n', '<left>', '<C-w>h')
map('n', '<Right>', '<C-w>l')
map('n', '<Up>', '<C-w>k')
map('n', '<Down>', '<C-w>j')

-- LSP
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Показать диагностику' })

if vim.lsp.inlay_hint then
  map('n', '<leader>L', function()
    local bufnr = vim.api.nvim_get_current_buf()
    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
    vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
  end, { desc = 'Включить Inlay Hints' })
end

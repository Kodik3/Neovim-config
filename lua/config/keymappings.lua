local map = vim.keymap.set

map({ 'i', 's' }, '<S-Tab>', '<C-d>', { desc = 'Shift-Tab action' })
map('i', '<C-h>', '<C-w>', { desc = 'delete word' })
map('n', "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map('v', '<C-c>', '"+y', { desc = 'Копировать выделенное' })
map('n', '<C-v>', '"+p', { desc = 'Вставить после курсора' })
map('i', '<C-v>', '<C-r>+', { desc = 'Вставить в текущее место' })
map('c', '<C-v>', '<C-r>+', { desc = 'Вставить в командной строке' })
map('n', '<C-a>', 'ggVG', { desc = 'Выделить весь файл' })
map('n', '<C-s>', ':w<CR>', { desc = 'Сохранить файл' })
map('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Выход в normal mode (Terminal)' })
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Очистка подсветки поиска' })

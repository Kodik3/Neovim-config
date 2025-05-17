local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map({ 'i', 's' }, '<S-Tab>', '<C-d>', { desc = 'Shift-Tab action' })

-- ==============================
-- Перемещение строки вверх/вниз
-- ==============================
-- Нормальный режим
map('n', '<C-Up>', function()
  vim.cmd('m .-2')
  vim.cmd('normal! ==')
end, opts)

map('n', '<C-Down>', function()
  vim.cmd('m .+1')
  vim.cmd('normal! ==')
end, opts)

-- Вставочный режим
map('i', '<C-Up>', function()
  vim.cmd('stopinsert')
  vim.cmd('m .-2')
  vim.cmd('normal! ==')
  vim.cmd('startinsert')
end, opts)

map('i', '<C-Down>', function()
  vim.cmd('stopinsert')
  vim.cmd('m .+1')
  vim.cmd('normal! ==')
  vim.cmd('startinsert')
end, opts)

-- ==============================
-- Копирование / Вставка
-- ==============================
map('v', '<C-c>', '"+y', { desc = 'Копировать выделенное' })

map('n', '<C-v>', '"+p', { desc = 'Вставить после курсора' })
map('i', '<C-v>', '<C-r>+', { desc = 'Вставить в текущее место' })
map('c', '<C-v>', '<C-r>+', { desc = 'Вставить в командной строке' })

-- ==============================
-- Полное выделение файла
-- ==============================
-- Ctrl+A в нормальном режиме — выделить весь файл
map('n', '<C-a>', 'ggVG', { desc = 'Выделить весь файл' })

-- Сохранить файл
map('n', '<C-s>', ':w<CR>', { desc = 'Сохранить файл' })

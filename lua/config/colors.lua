local M = {}

M.themes = {
  catppuccin = { 'latte', 'frappe', 'macchiato', 'mocha' },
  tokyonight = { 'storm', 'night', 'moon', 'day' },
  onedark = { 'dark' },
}

-- Установка темы
function M.setup(scheme, variant)
  vim.opt.termguicolors = true

  if not scheme or scheme == '' then
    print('Укажите название темы. Используйте :SetColor list для списка.')
    return
  end

  if scheme == 'catppuccin' then
    require('catppuccin').setup({
      flavour = variant or 'mocha',
      transparent_background = true,
    })
  elseif scheme == 'tokyonight' then
    vim.g.tokyonight_style = variant or 'storm'
  end

  -- Применить colorscheme
  local ok, err = pcall(vim.cmd.colorscheme, scheme)
  if not ok then
    print('Ошибка применения темы: ' .. err)
  end
end

-- Получить список тем
function M.list()
  for theme, variants in pairs(M.themes) do
    print('  ' .. theme .. ' → ' .. table.concat(variants, ', '))
  end
end

return M

vim.api.nvim_create_user_command('SetColor', function(opts)
  local args = vim.split(opts.args, ' ')
  local colors = require('config.colors')

  if args[1] == 'list' then
    colors.list()
  else
    colors.setup(args[1], args[2])
  end
end, {
  nargs = '+',
  complete = function(_, line)
    local items = {}
    local input = vim.split(line, '%s+')
    local current = input[#input]
    local colors = require('config.colors')

    if #input == 2 then
      -- Предложить темы
      for theme, _ in pairs(colors.themes) do
        if theme:find('^' .. current) then
          table.insert(items, theme)
        end
      end
    elseif #input == 3 then
      -- Предложить варианты
      local variants = colors.themes[input[2]]
      if variants then
        for _, var in ipairs(variants) do
          if var:find('^' .. current) then
            table.insert(items, var)
          end
        end
      end
    end

    return items
  end,
  desc = 'Сменить цветовую схему (:SetColor [тема] [вариант] или :SetColor list)',
})
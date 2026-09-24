local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
  defaults = { lazy = false, version = false },
  change_detection = { enabled = true, notify = false },
  concurrency = 50,
  checker = { enabled = true, notify = false },
  ui = { border = 'rounded' },
  rocks = { enabled = false },
})

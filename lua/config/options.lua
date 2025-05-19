vim.o.foldenable = true     -- Enable folding by default
vim.o.foldmethod = 'manual' -- Default fold method (change as needed)
vim.o.foldlevel = 99        -- Open most folds by default
vim.o.foldcolumn = '0'

vim.opt.isfname:append("@-@")

local options = {
  nu = true,
  relativenumber = true,

  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,
  wrap = false,

  swapfile = false,
  backup = false,
  undofile = true,

  incsearch = true,
  inccommand = 'split',

  ignorecase = true,
  smartcase = true,

  termguicolors = true,
  background = 'dark',

  scrolloff = 8,
  signcolumn = 'yes',

  backspace = { "start", "eol", "indent" },
  splitright = true,
  splitbelow = true,

  updatetime = 50,
  colorcolumn = '80',
  hlsearch = true,

  mouse = 'a',
  mousefocus = true,

  laststatus = 3,
  showmode = false,
  cmdheight = 0,
  pumheight = 10,
  smarttab = true,
  cindent = true,
  fixeol = false,
  showmatch = true,
  conceallevel = 2,
  concealcursor = '',
  wildignore = '*node_modules/**',
  completeopt = 'menu,menuone,noselect',
  writebackup = false,
  shada = "'1000",
  encoding = 'utf-8',
  fileencoding = 'utf-8',
  clipboard = 'unnamed,unnamedplus',
  errorbells = false,
  timeoutlen = 200,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Глобальные переменные
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.speeddating_no_mappings = 1
vim.g.editorconfig = true
vim.g.netrw_banner = 0
vim.o.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-TermCursor'

vim.opt.isfname:append('@-@')

local options = {
  nu = true,
  relativenumber = true,

  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,
  wrap = true,

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

  backspace = { 'start', 'eol', 'indent' },
  splitright = true,
  splitbelow = true,

  updatetime = 50,
  colorcolumn = '80',
  hlsearch = true,

  mouse = 'a',
  mousefocus = true,

  foldmethod = 'expr',
  foldexpr = 'v:lua.vim.treesitter.foldexpr()',
  foldlevel = 99,

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
  shada = '\'1000',
  encoding = 'utf-8',
  fileencoding = 'utf-8',
  clipboard = 'unnamed,unnamedplus',
  errorbells = false,
  timeoutlen = 200,
  emoji = false,
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

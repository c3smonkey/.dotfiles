vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.copyindent = true
vim.opt.updatetime = 100
vim.o.updatetime = 250
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 35
vim.opt.expandtab = true
vim.opt.termguicolors = true

vim.cmd[[
  au TextYankPost * silent! lua vim.highlight.on_yank()
]]

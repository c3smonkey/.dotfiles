-- nvim/lua/c3smonkey/config/options.lua

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "200"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.wrap = false


vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true


vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 8
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true


vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.swapfile = false
vim.opt.backup = false


vim.opt.updatetime = 50
vim.opt.timeoutlen = 300


vim.opt.termguicolors = true
vim.opt.guifont = "FiraCode Nerd Font:h17"


vim.opt.spelllang = "en_us,de,de_ch"
vim.opt.spell = true

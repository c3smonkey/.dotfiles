-- VimWik
vim.cmd("set nocompatible")
vim.cmd("filetype plugin on")
vim.cmd("syntax on")
-- Configure Vimwiki paths
vim.g.vimwiki_list = {
    { path = '~/git/vimwiki', syntax = 'markdown', ext = '.md' },
    -- Add more paths as needed
}

-- General
vim.g.mapleader = " "
vim.g.netrw_banner = 0

local opt = vim.opt
opt.encoding = "utf-8"
opt.clipboard = "unnamedplus"
opt.spelllang = "en_us,de,de_ch"
opt.spell = true
opt.swapfile = false
opt.relativenumber = true
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.incsearch = true
opt.hlsearch = true
opt.hidden = true
opt.cursorline = true
opt.scrolloff = 10
opt.autowrite = true
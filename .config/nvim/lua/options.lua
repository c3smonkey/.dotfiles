-- nvim/lua/optiona.lua

vim.g.mapleader = " "
vim.maplocalleader = " "

vim.o.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true

vim.signcolumn = "yes"

vim.o.tabstop = 4
vim.o.shiftwidht = 4

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = "a"

-- Disable netrw banner
vim.g.netrw_banner = 0
-- Open netrw in a vertical split
vim.g.netrw_altv = 1
-- Set netrw list style to tree
vim.g.netrw_liststyle = 3
-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true


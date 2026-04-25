vim.g.mapleader = ' '
vim.g.maplocalleader = ''
vim.o.relativenumber = true
vim.o.number = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.completeopt = 'menu,menuone,noselect,popup'
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)
vim.o.confirm = true

require('config.pack')
require('config.transparent')
require('config.lsp'
require('config.kotlin')
require('config.keymaps')


vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.scrolloff = 8
vim.opt.incsearch = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.linebreak  = true
vim.opt.breakindent = true

vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/mikavilpas/yazi.nvim',
  'https://github.com/folke/which-key.nvim'
})

-- Keymaps laden
require('keymaps')

-- Colorscheme Setup
require('colorscheme')

-- Mini.nvim Plugins
require('mini.basics').setup()
require('mini.surround').setup()
require('mini.comment').setup()
require('mini.pairs').setup()
require('mini.tabline').setup()
require('mini.pick').setup()
require('mini.files').setup()

require('mini.statusline').setup({
  content = {
    active = function()
      return table.concat({
        "[%{mode()}]",
        "%f",
        "%m",
        "%=",
        "%l/%L",
      }, " ")
    end,
  }
})

-- Yazi File Manager
require('yazi').setup({
  open_for_directories = false,
  floating_window_scaling_factor = 0.9,
  yazi_floating_window_border = 'rounded',
})

require('which-key').setup()



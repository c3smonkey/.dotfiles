-- NOTE:
-- Thanks to https://github.com/Traap/nvim/
--
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- Aktiviere Dateityp-Erkennung und Syntax-Highlighting
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')
vim.cmd('syntax on')

-- Bootstrap using lazy.nvim package manager.
require("config.c3s.bootstrap")
require("config.lazy")

-- Apply  customizations.
require("config.configure")

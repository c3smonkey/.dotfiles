-- NOTE:
-- Thanks to https://github.com/Traap/nvim/
--
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- Bootstrap using lazy.nvim package manager.
require("config.c3s.bootstrap")
require("config.lazy")

-- Apply  customizations.
require("config.customize")

-- Load snippets from ~/.config/nvim/LuaSnip/
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})


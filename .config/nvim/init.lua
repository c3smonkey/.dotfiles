-- init.lua
-- load settings before lazy
require("config.settings")
require("config.keymaps")
require("config.lazy")

-- set colorscheme
vim.cmd("colorscheme catppuccin-mocha")

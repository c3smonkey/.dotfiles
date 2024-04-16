-- init.lua
-- load settings before lazy
require("config.settings")
require("config.keymaps")
require("config.lazy")

-- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme catppuccin")
vim.g.theme_id = 4
-- end themery block
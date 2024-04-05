-- init.lua
-- load settings before lazy
require("config.settings")
require("config.keymaps")
require("config.lazy")

-- set colorscheme
-- BUG: colorscheme must be set after lazy loading, otherwise it will be overwritten
-- normally it should be set in the plugin colorscheme. Sometinge it is not working so it is set here
vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("colorscheme monokai-pro-spectrum")

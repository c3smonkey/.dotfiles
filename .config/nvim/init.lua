-- init.lua
-- load settings before lazy
require("config.globals")
require("config.commands")
require("config.keymaps")
require("config.options")
require("config.lazy")
require("config.lsp")
-- set colorscheme
-- INFO: colorscheme must be set after lazy loading, otherwise it will be overwritten
-- normally it should be set in the plugin colorscheme. Sometinge it is not working so it is set here
vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("colorscheme monokai-pro-spectrum")

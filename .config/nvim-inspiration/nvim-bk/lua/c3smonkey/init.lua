-- nvim/lua/c3smonkey/init.lua

require("c3smonkey.config.globals")
require("c3smonkey.config.options")
require("c3smonkey.config.commands")
require("c3smonkey.config.keymaps")
-- must loaded last
require("c3smonkey.config.lazy_init")

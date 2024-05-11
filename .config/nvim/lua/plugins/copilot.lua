
require("config.c3s.globals")

local plugin = "copilot.vim"

return {
	{
		"github/" .. plugin,
		event = "VeryLazy",
		enabled = Is_Enabled(plugin),
	}
-- TODO> add copilot keybindings and chat
}


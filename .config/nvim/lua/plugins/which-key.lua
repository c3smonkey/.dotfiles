require("config.c3s.globals")

local plugin = "which-key.nvim"

return {
	"folke/" .. plugin,
	event = "VeryLazy",
	enabled = Is_Enabled(plugin),
	config = function(_, config)
		if Use_Default_Config(plugin) then
			config = config
		else
			-- This is the function that runs, AFTER loading
			require('which-key').setup()


			-- Define custom keybindings
			require('which-key').register {}



		end
	end,
}

require("config.c3s.globals")

local plugin = "twilight.nvim"

return {
    "folke/" .. plugin,
    event = "VeryLazy",
    enabled = Is_Enabled(plugin),

	opts = {
		
    }
}

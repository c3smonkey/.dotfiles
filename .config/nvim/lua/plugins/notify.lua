require("config.c3s.globals")

local plugin = "nvim-notify"

return {
	"rcarriga/" .. plugin,
	event = "VeryLazy",
	enabled = Is_Enabled(plugin),
	opts = {
		timeout = 5000,
		background_colour = "#000000",
		render = "wrapped-compact",
		icons = {
			ERROR = "",
			WARN = "",
			INFO = "",
			DEBUG = "",
		},
	},
}

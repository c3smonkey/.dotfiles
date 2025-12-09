require("config.c3s.globals")

local plugin = "which-key.nvim"

return {
	"folke/" .. plugin,
	event = "VeryLazy",
	enabled = Is_Enabled(plugin),
	opts = {},
	keys = {
		-- Falls du Keybindings definieren möchtest, hier ein Beispiel:
		-- { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps" },
	},
}

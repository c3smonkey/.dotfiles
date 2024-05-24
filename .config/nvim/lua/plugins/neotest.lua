require("config.c3s.globals")

local plugin = "neotest"

return {
	{
		"nvim-neotest/" .. plugin,
		event = "VeryLazy",
		enabled = Is_Enabled(plugin),
		requires = {
			"nvim-neotest/neotest-go",
		},
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter"
		}
	}
}

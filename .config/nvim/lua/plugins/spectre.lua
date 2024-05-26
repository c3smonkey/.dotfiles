
require("config.c3s.globals")

local plugin = "nvim-spectre"

return {
	{
		"nvim-pack/" .. plugin,
		event = "VeryLazy",
		enabled = Is_Enabled(plugin),
		cmd = { "Spectre" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
		config = function()

			require("spectre").setup({
				highlight = {
					search = "SpectreSearch",
					replace = "SpectreReplace",
				},
				mapping = {
					["send_to_qf"] = {
						map = "<C-q>",
						cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
						desc = "send all items to quickfix",
					},
				},
			})
		end,
	}
}


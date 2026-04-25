require("config.c3s.globals")

local plugin = "trouble.nvim"

return {
	{
		"folke/" .. plugin,
		enabled = Is_Enabled(plugin),
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>tt",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "[t]roube diagnostics [t]oggle",
			},
			{
				"<leader>tb",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "[t]rouble [b]uffer Diagnostics",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "[t]rouble [s]ymbols",
			},
			{
				"<leader>tl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "[t]rouble [l]sp",
			},
			{
				"<leader>tL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "[t]roube [L]ocation list",
			},
			{
				"<leader>tQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "[t]rouble [Q]uickfix list",
			},
		},
	}
}

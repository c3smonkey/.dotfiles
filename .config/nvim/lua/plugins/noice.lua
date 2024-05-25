require("config.c3s.globals")

local plugin = "noice.nvim"

return {
	"folke/" .. plugin,
	event = "VeryLazy",
	enabled = Is_Enabled(plugin),

	dependencies = {
		{ "MunifTanjim/nui.nvim" },
		-- {
		-- 	"rcarriga/nvim-notify",
		-- 	opts = {
		-- 		timeout = 5000,
		-- 		background_colour = "#000000",
		-- 		render = "wrapped-compact",
		-- 		icons = {
		-- 			ERROR = "",
		-- 			WARN = "",
		-- 			INFO = "",
		-- 			DEBUG = "",
		-- 		},
		-- 	},
		-- },
	},

	---@class NoiceConfig
	opts = function(_, opts)
		if Use_Default_Opts(plugin) then
			opts = opts
		else
			opts = {
				---@type NoicePresets
				presets = {
					inc_rename = true,
				},
				---@type NoiceConfigViews
				views = {
					cmdline_popup = {
						position = {
							row = 7,
							col = "55%",
						},
					},
					cmdline_popupmenu = {
						position = {
							row = 7,
							col = "55%",
						},
					},
					cmdline_popupmenu_filter = {
						position = {
							row = 7,
							col = "55%",
						},
					},
				},

			}
		end

		Keymap("n", "<leader>ns", "<CMD>NoiceDismiss<CR>", { desc = "[n]oice dismis[s]" })
		Keymap("n", "<leader>ne", "<CMD>NoiceErrors<CR>", { desc = "[n]oice [e]rrors" })
		Keymap("n", "<leader>nh", "<CMD>NoiceHistory<CR>", { desc = "[n]oice [h]istory" })
		Keymap("n", "<leader>nl", "<CMD>NoiceLast<CR>", { desc = "[n]oice [l]ast" })
		-- Noice telescope
		Keymap("n", "<leader>nt", "<CMD>Noice telescope<CR>", { desc = "[n]oice [t]elescope" })

	end,
}


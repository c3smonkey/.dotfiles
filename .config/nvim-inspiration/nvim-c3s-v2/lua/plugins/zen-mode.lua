require("config.c3s.globals")

local plugin = "zen-mode.nvim"

if Is_Enabled(plugin) then
	Keymap("n", "<leader>z", [[<cmd>lua require("zen-mode").toggle()<cr>]], { desc = "[z]en mode" })
end

return {
	"folke/" .. plugin,
	enabled = Is_Enabled(plugin),

	opts = {
		window = {
			width = 0.60,
			height = 0.85,
			options = {
				colorcolumn = "",
				cursorcolumn = false,
				cursorline = false,
				number = true,
				relativenumber = true,
				signcolumn = "no",
			},
		},
		event = { "BufEnter *.rb" },
		plugins = {
			enabled = true,
			options = {
				ruler = false,
				showmd = true,
			},
			twilight = { enabled = true },
			gitsigns = { enabled = false },
			tmux = { enabled = false },
			alacritty = {
				enabled = true,
				font = "15",
			},
		},
	}
}
--
-- return {
-- 	"folke/" .. plugin,
-- 	enabled = Is_Enabled(plugin),
--     event = { "BufReadPost", "BufNewFile" },
--
-- 	-- opts = {
-- 	--   window = {
-- 	--     width = 0.65,
-- 	--     height = 0.85,
-- 	--     options = {
-- 	--       colorcolumn = "",
-- 	--       cursorcolumn = false,
-- 	--       cursorline = false,
-- 	--       number = true,
-- 	--       relativenumber = true,
-- 	--     },
-- 	--   },
-- 	--   event = { "BufEnter *.rb" },
-- 	--   plugins = {
-- 	--     enabled = true,
-- 	--     options = {
-- 	--       ruler = false,
-- 	--       showmd = true,
-- 	--     },
-- 	--     twilight = { enabled = false },
-- 	--     gitsigns = { enabled = false },
-- 	--     tmux = { enabled = false },
-- 	--     alacritty = {
-- 	--       enabled = true,
-- 	--       font = "15",
-- 	--     },
-- 	--   },
-- 	-- },
-- 	opts = {
-- 		window = {
-- 			backdrop = 0.95,
-- 			width = 100,
-- 			height = 0.8,
-- 			options = {signcolumn = "no", number = false, cursorline = false}
-- 		},
--
-- 	},
-- 	-- event = { "BufEnter *.rb" },
-- 	plugins = {
-- 		options = {enabled = true, ruler = false, showcmd = false},
-- 		twilight = {enabled = true},
-- 		gitsigns = {enabled = false},
-- 		tmux = {enabled = false}
-- 	},
-- 	on_open = function(_)
-- 		vim.cmd(':TwilightEnable')
-- 	end
-- }
--
--

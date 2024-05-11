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



--[[ from josh

return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	deps = {
		"b0o/incline.nvim",
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		window = {
			zindex = 10,
			backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			-- height and width can be:
			-- * an absolute number of cells when > 1
			-- * a percentage of the width / height of the editor when <= 1
			-- * a function that returns the width or the height
			width = 0.85, -- width of the Zen window
			height = 0.85, -- height of the Zen window
			-- by default, no options are changed for the Zen window
			-- uncomment any of the options below, or add other vim.wo options you want to apply
			options = {
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				list = false, -- disable whitespace characters
			},
		},
		plugins = {
			-- disable some global vim options (vim.o...)
			-- comment the lines to not apply the options
			options = {
				enabled = true,
				ruler = false, -- disables the ruler text in the cmd line area
				showcmd = false, -- disables the command in the last line of the screen
			},
			twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
			gitsigns = { enabled = true }, -- disables git signs
			tmux = { enabled = true }, -- disables the tmux statusline
			-- this will change the font size on kitty when in zen mode
			-- to make this work, you need to set the following kitty options:
			-- - allow_remote_control socket-only
			-- - listen_on unix:/tmp/kitty
			kitty = {
				enabled = false,
				font = "+2", -- font size increment
			},
			-- this will change the font size on alacritty when in zen mode
			-- requires  Alacritty Version 0.10.0 or higher
			-- uses `alacritty msg` subcommand to change font size
			alacritty = {
				enabled = true,
				font = "22", -- font size
			},

			-- this will change the font size on wezterm when in zen mode
			-- See alse also the Plugins/Wezterm section in this projects README
			wezterm = {
				enabled = true,
				-- can be either an absolute font size or the number of incremental steps
				font = "+5", -- (10% increase per step)
			},
		},
		-- callback where you can add custom code when the Zen window opens
		on_open = function()
			require("noice").disable()
			require("incline").disable()
			require("barbecue.ui").toggle(false)
			vim.g.miniindentscope_disable = true
		end,
		-- callback where you can add custom code when the Zen window closes
		on_close = function()
			require("noice").enable()
			require("incline").enable()
			require("barbecue.ui").toggle(true)
			vim.g.miniindentscope_disable = false
		end,
	},
}


]]


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

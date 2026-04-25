local wezterm = require("wezterm")

wezterm.enable_osc8_hyperlink = true

local config = {}

require("fonts").setup(config)
require("background").setup(config)

config.term = "screen-256color"

-- ===== GRUVBOX MATERIAL DARK HARD CUSTOM COLORS =====
config.color_scheme = "gruvbox_material_dark_hard"
config.color_schemes = {
	["gruvbox_material_dark_hard"] = {
		foreground = "#D4BE98",
		background = "#1D2021",  -- Hard background (darkest)
		cursor_bg = "#D4BE98",
		cursor_border = "#D4BE98",
		cursor_fg = "#1D2021",
		selection_bg = "#D4BE98",
		selection_fg = "#3C3836",
		
		ansi = {
			"#1d2021",  -- black
			"#ea6962",  -- red
			"#a9b665",  -- green
			"#d8a657",  -- yellow
			"#7daea3",  -- blue
			"#d3869b",  -- magenta
			"#89b482",  -- cyan
			"#d4be98"   -- white
		},
		brights = {
			"#eddeb5",  -- bright black
			"#ea6962",  -- bright red
			"#a9b665",  -- bright green
			"#d8a657",  -- bright yellow
			"#7daea3",  -- bright blue
			"#d3869b",  -- bright magenta
			"#89b482",  -- bright cyan
			"#d4be98"   -- bright white
		},
	},
}

config.hide_tab_bar_if_only_one_tab = true
config.hide_mouse_cursor_when_typing = true

-- config.default_cursor_style = "SteadyUnderline"
-- config.default_cursor_style = "BlinkingBlock"
-- config.default_cursor_style = "BlinkingUnderline"
-- config.default_cursor_style = "SteadyBar"
-- config.default_cursor_style = "SteadyBlock"
config.default_cursor_style = "BlinkingBar"

-- config.window_decorations = "NONE"
config.window_decorations = "RESIZE"
-- config.window_close_confirmation = "AlwaysPrompt"
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 20,
}


config.keys = {
    { key = "+", mods = "CMD", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },	
    { key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },
    
}



return config

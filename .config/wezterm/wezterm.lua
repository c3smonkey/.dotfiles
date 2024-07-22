local wezterm = require("wezterm")

wezterm.enable_osc8_hyperlink = true

local config = {}

require("fonts").setup(config)
require("background").setup(config)

config.term = "screen-256color"

-- config.color_scheme = "Dracula"
config.color_scheme = "Catppuccin Mocha"

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

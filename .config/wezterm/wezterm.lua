local wezterm = require("wezterm")


wezterm.enable_osc8_hyperlink = true

local config = {}

require("fonts").setup(config)
require("background").setup(config)


-- config.color_scheme = "Dracula"
config.color_scheme = "Catppuccin Mocha"

config.hide_tab_bar_if_only_one_tab = true
config.hide_mouse_cursor_when_typing = true

config.default_cursor_style = "SteadyUnderline"

-- config.window_decorations = "NONE"
config.window_decorations = "RESIZE"
-- config.window_close_confirmation = "AlwaysPrompt"
config.window_close_confirmation = 'NeverPrompt'


return config

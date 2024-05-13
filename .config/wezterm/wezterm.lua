local wezterm = require("wezterm")


wezterm.enable_osc8_hyperlink = true

local config = {}

-- TODO: animated gif support
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/wavy-lines.gif"
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/ai-speech.gif"
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/lines.gif"
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/blob_blue.gif"
config.window_background_image = require("functions.background")
config.window_background_image_hsb = {
	brightness = 0.01,
	hue = 1.0,
	saturation = 1.0,
}
config.window_background_opacity = 0.8


-- Font configuration
config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular", italic = false })
config.font_size = 11.0
config.line_height = 1.1

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

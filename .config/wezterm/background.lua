local background = {}

function background.setup(config)

	-- config.window_background_image = require("functions.background")
	config.window_background_image_hsb = {
		brightness = 0.01,
		hue = 1.0,
		saturation = 1.0,
	}
	config.window_background_opacity = 0.9
	config.macos_window_background_blur = 10

end

return background

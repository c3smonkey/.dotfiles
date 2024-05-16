local backgroundImage = require("functions.background")
--
local background = {}

function background.setup(config)

    config.window_background_image = backgroundImage
    config.window_background_image_hsb = {
        brightness = 0.01,
        hue = 1.0,
        saturation = 1.0,
    }
    config.window_background_opacity = 0.8

end

return background

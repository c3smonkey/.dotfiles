-- TODO: animated gif support
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/wavy-lines.gif"
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/ai-speech.gif"
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/lines.gif"
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/blob_blue.gif"


local wallpapers = {
    { path = os.getenv("HOME") .. "/.config/wezterm/jpeg/background.jpeg" },
    { path = os.getenv("HOME") .. "/.config/wezterm/jpeg/1_background.jpeg" },
    { path = os.getenv("HOME") .. "/.config/wezterm/jpeg/2_background.jpeg" },
    { path = os.getenv("HOME") .. "/.config/wezterm/jpeg/3_background.jpeg" },
    { path = os.getenv("HOME") .. "/.config/wezterm/jpeg/4_background.jpeg" },
    { path = os.getenv("HOME") .. "/.config/wezterm/jpeg/5_background.jpeg" },
    { path = os.getenv("HOME") .. "/.config/wezterm/jpeg/6_background.jpeg" },
    { path = os.getenv("HOME") .. "/.config/wezterm/jpeg/7_background.jpeg" },
    { path = os.getenv("HOME") .. "/.config/wezterm/jpeg/8_background.jpeg" },
}

function getImageNumber(imagePath)
    local imageName = imagePath:match(".*/([^/]+)$")
    local imageNumber = tonumber(imageName:match("(%d+)_background%.jpeg$"))
    return imageNumber
end

-- Function to select a random image
function getRandomImage()
    math.randomseed(os.time())

    local random = math.random(1, #wallpapers)
    local imagePath = wallpapers[random].path

    local imageNumber = getImageNumber(imagePath)

    print("Selected image index:", random)
    print("Image path:", imagePath)
    print("Image number:", imageNumber)

    if imageNumber then
        return imagePath
    else
        return wallpapers[1].path
    end
end

return getRandomImage()

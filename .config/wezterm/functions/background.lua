-- TODO: animated gif support
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/wavy-lines.gif"
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/ai-speech.gif"
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/lines.gif"
-- config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/gif/blob_blue.gif"

local wallpapers = {}
local numWallpapers = 12 -- Total number of wallpapers

for i = 1, numWallpapers do
    local imagePath = os.getenv("HOME") .. "/.config/wezterm/jpeg/" .. i .. "_background.jpeg"
    wallpapers[i] = { path = imagePath }
end

function getImageNumber(imagePath)
    local imageName = imagePath:match(".*/([^/]+)$")
    local imageNumber = tonumber(imageName:match("(%d+)_background%.jpeg$"))
    return imageNumber
end

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


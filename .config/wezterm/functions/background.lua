local wallpapers = {
    { path = os.getenv("HOME") .. "/.config/wezterm/jpg/background.jpg" },
    { path = os.getenv("HOME") .. "/.config/wezterm/jpg/1_background.jpg" },
    { path = os.getenv("HOME") .. "/.config/wezterm/jpg/2_background.jpg" },
}

function getImageNumber(imagePath)
	local imageName = imagePath:match(".*/([^/]+)$")
	local imageNumber = tonumber(imageName:match("(%d+)_background%.jpg$"))
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


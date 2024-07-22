local wezterm = require('wezterm')
--
local fonts = {}

font_size = 13.0
line_height = 1.1
weight = "Light"

-- fontName = "JetBrainsMono Nerd Font Mono"
-- fontName = "JetBrains Mono"
-- fontName = "FiraCode Nerd Font Mono"
-- fontName = "MesloLGS NF"
-- fontName = "ComicShannsMono"
-- fontName = "CommitMono Nerd Font"
-- fontName = "Monoid Nerd Font Mono"
-- fontName = "Geist-Thin"
--
--
-- fontName = "Fira Code"
fontName = "MesloLGS Nerd Font Mono"

function fonts.setup(config)
    config.font = wezterm.font(fontName, { weight = weight })
    config.font_size = font_size
    config.line_height = line_height
end

return fonts

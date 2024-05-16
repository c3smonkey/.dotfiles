local wezterm = require('wezterm')
--
local fonts = {}

function fonts.setup(config)
-- config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular", italic = false })
-- config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular", italic = false })
-- config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Bold", italic = false })
-- config.font = wezterm.font("MesloLGS NF", { weight = "Regular", italic = false })
-- config.font = wezterm.font("ComicShannsMono", { weight = "Regular", italic = false })
-- config.font = wezterm.font("CommitMono Nerd Font", { weight = "Regular", italic = false })
-- config.font = wezterm.font("Geist-Thin", { weight = "Regular", italic = false })
-- config.font = wezterm.font("Monoid Nerd Font Mono", { weight = "Regular", italic = false })
    config.font = wezterm.font("JetBrainsMono Nerd Font Mono", {
        weight = "Bold", italic = false
    })
    config.font_size = 12.0
    config.line_height = 1.1
end

return fonts

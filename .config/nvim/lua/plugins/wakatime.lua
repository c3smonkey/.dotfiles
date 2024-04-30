require("config.c3s.globals")

local plugin = "vim-wakatime"

return {
    "wakatime/" .. plugin,
    event = "VeryLazy",
    enabled = Is_Enabled(plugin),
}

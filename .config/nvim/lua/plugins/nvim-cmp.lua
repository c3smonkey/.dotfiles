require("config.c3s.globals")

local plugin = "nvim-cmp"

return {
    {
        "hrsh7th/" .. plugin,
        enabled = Is_Enabled(plugin),
        event = "InsertEnter",
    },
}

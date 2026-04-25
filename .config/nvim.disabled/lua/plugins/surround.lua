require("config.c3s.globals")

local plugin = "nvim-surround"

return {
    "kylechui/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    config = true,
    -- ysiw  yank surround inner word
    -- yss)  yank surround sentence
    -- cs"'  change surround " to '
    -- ds"   delete surround "
    -- yssb  yank surround sentence
    -- yss)  yank surround sentence
}



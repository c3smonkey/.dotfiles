require("config.c3s.globals")

local plugin = "fzf.vim"

return {
    "junegunn/" .. plugin,
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(plugin),
    dependencies = { "Traap/vim-bundle-fzf" },
}

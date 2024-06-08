require("config.c3s.globals")

local plugin = "todo-comments.nvim"

return {
    "folke/" .. plugin,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    enabled = Is_Enabled(plugin),
    opts = function(_, opts)
        if Use_Default_Opts(plugin) then
            opts = opts
        else
            opts.signs = true
            opts.merge_keywords = true
            opts.keywords = {
                NOTE = { icon = " ", color = "#8A69BB", alt = {"note"}},
                INFO = { icon = " ", color = "#ffd966", alt = {"info"}},
            }
        end
    end,
}

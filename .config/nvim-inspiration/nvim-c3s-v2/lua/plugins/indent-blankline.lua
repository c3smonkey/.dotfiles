require("config.c3s.globals")

local plugin = 'indent-blankline'

return {
    "lukas-reineke/" .. plugin .. ".nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(plugin),
    main = "ibl",
    opts = function(_, opts)
        if Use_Default_Opts(plugin) then
            opts = {}
        else
            opts = {
                indent = { char = "│" },
                exclude = { filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "lazy",
                    "mason",
                } },
            }
        end
    end,
}
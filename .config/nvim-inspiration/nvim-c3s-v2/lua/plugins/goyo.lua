require("config.c3s.globals")

local plugin = "goyo.vim"

return {
    "junegunn/" .. plugin,
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(plugin),
    keys = {
        { "<leader>wG", "<cmd>lua Goyo.goyoEnter()<cr>", desc = "[w]riting - enter [G]oyo" },
    },
}




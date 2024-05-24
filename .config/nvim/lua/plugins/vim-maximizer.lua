require("config.c3s.globals")

local plugin = "vim-maximizer"

return {
    {
        "szw/" .. plugin,
        enabled = Is_Enabled(plugin),
        event = "VeryLazy",
        config = function()
            Keymap("n", "<leader>m", "<cmd>MaximizerToggle!<cr>",{ desc = "toggle [m]aximizer" })
        end,
    }
}

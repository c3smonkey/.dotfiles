require("config.c3s.globals")

local plugin = "vim-fugitive"

return {
    "tpope/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = 'VeryLazy',
    cmd = "G",
    config = function()
        --to close the fugitive window use vim command :q or CTRL-W - c (close window)
        Keymap("n", "<localleader>ga", "<cmd>G blame<cr>", { silent = true, desc = "[g]it [a]notation (blame)" })
        Keymap("n", "<localleader>gc", "<cmd>G commit<cr>", { silent = true, desc = "[g]it [c]ommit" })
    end,
}

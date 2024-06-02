require("config.c3s.globals")

local plugin = "vim-go"

return {
    "fatih/" .. plugin,
    enabled = Is_Enabled(plugin),
    cmd = { "GoInstallBinaries" },
    config = function()
        Keymap("n", ",i", "<cmd>GoImports<cr>",{ desc = "GO [i]mports" })
    end,
}
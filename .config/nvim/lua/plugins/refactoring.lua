require("config.c3s.globals")

local plugin = "refactoring.nvim"

return {
    {
        "ThePrimeagen/" .. plugin,
        enabled = Is_Enabled(plugin),
        event = "BufRead",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    }
}
require("config.c3s.globals")

local plugin = "neotest"

return {
    {
        "nvim-neotest/" .. plugin,
        event = "VeryLazy",
        enabled = Is_Enabled(plugin),
        requires = {
            "nvim-neotest/neotest-go",
        },
        dependencies = {
            "nvim-neotest/neotest-go",
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            local neotest = require("neotest").setup({
                adapters = {
                    require("neotest-go")({
                        recursive_run = true
                    })
                }
            })

            vim.keymap.set("n", ",ts", function()
                require('neotest').summary.toggle()
            end, { desc = "[t]est [s]ummary" })

            Keymap("n", ",t", "<CMD>Neotest run<CR>", { desc = "[t]est Nearest" })

            vim.keymap.set("n", ",T", function()
                require('neotest').run.run(vim.fn.expand("%"))
            end, { desc = "[T]est File[" })

        end,
    }
}

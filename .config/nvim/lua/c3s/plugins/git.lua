return {
    {
        "tpope/vim-fugitive",
        config = function()
            local keymap = vim.keymap

            keymap.set("n", "<leader>gb", ":Git blame<CR>", { silent = true, desc = "[g]it [b]lame" })
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
            vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { silent = true, desc = "Lazy[g]it [g]it" })
        end,
    },
    -- TODO learn how to use this
    {
        "sindrets/diffview.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("diffview").setup()
            vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { silent = true, desc = "[g]it [d]iffview" })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})

            local keymap = vim.keymap

            keymap.set(
                "n",
                "<leader>gp",
                ":Gitsigns preview_hunk<CR>",
                { silent = true, desc = "[g]it [p]review Hunk" }
            )
            keymap.set(
                "n",
                "<leader>gt",
                ":Gitsigns toggle_current_line_blame<CR>",
                { silent = true, desc = "[g]it [t]oggle Current Line Blame" }
            )
        end,
    },
}

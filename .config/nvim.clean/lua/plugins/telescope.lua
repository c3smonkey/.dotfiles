return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>jr", "<cmd>Telescope oldfiles<cr>", { desc = "jr Jump to RecentFiles" }) -- find previously opened files
            vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", { desc = "ff Fuzzy find" })    -- find files within current working directory, respects .gitignore
            vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string" })       -- find string in current working directory as you type
            vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" }) -- find string under cursor in current working directory
            vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Show open buffers" })   -- list open buffers in current neovim instance
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Open help tags" })

            vim.keymap.set("n", "<leader>hf", "<cmd>Telescope harpoon marks<cr>", { desc = "Show harpoon marks" }) -- show harpoon marks

            vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Show git commits" }) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
            vim.keymap.set(
                "n",
                "<leader>gfc",
                "<cmd>Telescope git_bcommits<cr>",
                { desc = "Show git commits for current buffer" }
            )                                                                                           -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
            vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Show git branches" }) -- list git branches (use <cr> to checkout) ["gb" for git branch]
            vim.keymap.set(
                "n",
                "<leader>gs",
                "<cmd>Telescope git_status<cr>",
                { desc = "Show current git changes per file" }
            ) -- list current changes per file with diff preview ["gs" for git status]
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}

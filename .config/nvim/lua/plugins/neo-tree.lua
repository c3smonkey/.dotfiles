require("config.c3s.globals")

local plugin = "neo-tree.nvim"

return {
    {
        "nvim-neo-tree/" .. plugin,
        event = "VeryLazy",
        enabled = Is_Enabled(plugin),
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            local neo_tree = require("neo-tree")

            neo_tree.setup({
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = true,
                        hide_gitignored = true,
                        hide_hidden = false,
                        hide_by_name = {
                            ".DS_Store",
                            --"node_modules",
                        },
                        hide_by_pattern = {
                            --"*.meta",
                            --"*/src/*/tsconfig.json",
                        },
                        always_show = { -- remains visible even if other settings would normally hide it
                            ".gitignored",
                        },
                        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                            ".DS_Store",
                            --"thumbs.db",
                        },
                        never_show_by_pattern = { -- uses glob style patterns
                            --".null-ls_*",
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>ee", function()
                if neotree_open then
                    vim.cmd(":Neotree close")
                    neotree_open = false
                else
                    vim.cmd(":Neotree current filesystem reveal left")
                    neotree_open = true
                end
            end, { desc = "[e]xplor[e]r" })
            vim.keymap.set("n", "<leader>eb", ":Neotree buffers reveal float<CR>", { desc = "[e]xplorer [b]uffers" })
        end,
    }
}

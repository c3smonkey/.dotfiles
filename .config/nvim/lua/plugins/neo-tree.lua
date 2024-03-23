return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    config = function()
        vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
        vim.api.nvim_create_autocmd("BufWinEnter", {
            desc = "Open neo-tree on enter",
            group = "neotree_autoopen",
            callback = function()
                if not vim.g.neotree_opened then
                    vim.cmd("Neotree show")
                    vim.g.neotree_opened = true
                end
            end,
        })

        vim.keymap.set("n", "<leader>ee", function()
            if neotree_open then
                vim.cmd(":Neotree close")
                neotree_open = false
            else
                vim.cmd(":Neotree filesystem reveal left")
                neotree_open = true
            end
        end)
    end,
}

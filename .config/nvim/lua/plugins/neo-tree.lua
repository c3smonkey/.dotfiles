return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>ee", function()
            if neotree_open then
                vim.cmd(":Neotree close")
                neotree_open = false
            else
                vim.cmd(":Neotree current filesystem reveal left")
                neotree_open = true
            end

        end)
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    end,
}

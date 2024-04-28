return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local nvimtree = require("nvim-tree")

        vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

        -- configure nvim-tree
        nvimtree.setup({})

        vim.keymap.set("n", "<leader>ee", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file [E]xplor[e]r" }) -- toggle file explorer
        vim.keymap.set(
            "n",
            "<leader>ef",
            "<CMD>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file [E]xplorer On Current [F]ile" }
        ) -- toggle file explorer on current file
        vim.keymap.set("n", "<leader>ec", "<CMD>NvimTreeCollapse<CR>", { desc = "[C]ollapse File [E]xplorer" }) -- collapse file explorer
        vim.keymap.set("n", "<leader>er", "<CMD>NvimTreeRefresh<CR>", { desc = "[R]efresh File [E]xplorer" }) -- refresh file explorer
    end,
}

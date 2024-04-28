return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local nvimtree = require("nvim-tree")

        vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

        -- configure nvim-tree
        nvimtree.setup({})

        vim.keymap.set("n", "<leader>ee", "<CMD>NvimTreeToggle<CR>", { desc = "[e]xplor[e]r toggle file " }) -- toggle file explorer
        vim.keymap.set(
            "n",
            "<leader>ef",
            "<CMD>NvimTreeFindFileToggle<CR>",
            { desc = "[e]xplorer On current [f]ile toggle file " }
        ) -- toggle file explorer on current file
        vim.keymap.set("n", "<leader>ec", "<CMD>NvimTreeCollapse<CR>", { desc = "[e]xplorer [c]ollapse file" }) -- collapse file explorer
        vim.keymap.set("n", "<leader>er", "<CMD>NvimTreeRefresh<CR>", { desc = "[e]xplorer [r]efresh file" }) -- refresh file explorer
    end,
}

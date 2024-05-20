require("config.c3s.globals")

local plugin = "vim-test"

return {
    "vim-test/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = "VeryLazy",
    dependencies = {
        "preservim/vimux",
    },
    config = function()
        -- TODO Add keymaps for test
        vim.keymap.set("n", ",t", "<cmd>TestNearest<cr>", { silent = true, desc = "Test Nearest" })
        vim.keymap.set("n", ",T", "<cmd>TestFile<cr>", { silent = true, desc = "Test File" })
        vim.keymap.set("n", ",a", "<cmd>TestSuite<cr>", { silent = true, desc = "Test Suite" })
        vim.keymap.set("n", ",l", "<cmd>TestLast<cr>", { silent = true, desc = "Test Last" })
        vim.keymap.set("n", ",g", "<cmd>TestVisit<cr>", { silent = true, desc = "Test Visit" })
        vim.cmd("let test#strategy = 'vimux'")
    end,
}

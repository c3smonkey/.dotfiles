return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    -- TODO: "Add keymaps for trouble" TT  see The PrimeTime
    { "<leader>xx", "<CMD>TroubleToggle<CR>", desc = "Open/Close[X] Trouble[X] List" },
    { "<leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Open Trouble[X] [W]orkspace Diagnostics" },
    { "<leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "Open Trouble[X] [D]ocument Diagnostics" },
    { "<leader>xq", "<CMD>TroubleToggle quickfix<CR>", desc = "Open Trouble[X] [Q]uickfix List" },
    { "<leader>xl", "<CMD>TroubleToggle loclist<CR>", desc = "Open Trouble[X] [L]ocation List" },
    { "<leader>xt", "<CMD>TodoTrouble<CR>", desc = "Open Trouble[X] Todos In [T]rouble" },
  },
}

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    { "<leader>tt", "<CMD>TroubleToggle<CR>", desc = "[t] [t]rouble List" },
    { "<leader>tw", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Open [t]rouble [w]orkspace Diagnostics" },
    { "<leader>td", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "Open Trouble[X] [D]ocument Diagnostics" },
    { "<leader>tq", "<CMD>TroubleToggle quickfix<CR>", desc = "Open Trouble[X] [Q]uickfix List" },
    { "<leader>tl", "<CMD>TroubleToggle loclist<CR>", desc = "Open Trouble[X] [L]ocation List" },
    { "<leader>to", "<CMD>TodoTrouble<CR>", desc = "Open [t]rouble t[o]dos" },
  },
}

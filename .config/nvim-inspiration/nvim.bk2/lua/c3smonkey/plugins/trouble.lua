return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    { "<leader>tx", "<CMD>TroubleToggle<CR>", desc = "[t]rouble List Open/Close[x]" },
    { "<leader>tw", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Open [t]rouble [w]orkspace Diagnostics" },
    { "<leader>td", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "Open [t]rouble [d]ocument Diagnostics" },
    { "<leader>tq", "<CMD>TroubleToggle quickfix<CR>", desc = "Open [t]rouble [q]uickfix List" },
    { "<leader>tl", "<CMD>TroubleToggle loclist<CR>", desc = "Open [t]rouble [l]ocation List" },
    { "<leader>tt", "<CMD>TodoTrouble<CR>", desc = "Open [t]rouble Todos In [t]rouble" },
  },
}

require("config.c3s.globals")

local plugin = "trouble.nvim"

return {
  "folke/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    { "<leader>tt", "<CMD>TroubleToggle<CR>", desc = "[t] [t]rouble List" },
    { "<leader>tw", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "[t]rouble [w]orkspace Diagnostics" },
    { "<leader>td", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "[t]rouble [d]ocument Diagnostics" },
    { "<leader>tq", "<CMD>TroubleToggle quickfix<CR>", desc = "[t]rouble [q]uickfix List" },
    { "<leader>tl", "<CMD>TroubleToggle loclist<CR>", desc = "[t]rouble [l]ocation List" },
    { "<leader>to", "<CMD>TodoTrouble<CR>", desc = "[t]rouble t[o]dos" },
  },
}

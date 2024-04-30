require("config.c3s.globals")

local plugin = "vim-tmux-navigator"

return {
  "christoomey/" .. plugin,
  enabled = Is_Enabled(plugin) and In_Tmux(),
  event =  "VeryLazy",
  keys = {
    {"<c-h>", "<cmd>TmuxNavigateLeft<cr>", "Navigate Window Left"},
    {"<c-j>", "<cmd>TmuxNavigateDown<cr>", "Navigate Window Down"},
    {"<c-k>", "<cmd>TmuxNavigateUp<cr>", "Navigate Window Up"},
    {"<c-l>", "<cmd>TmuxNavigateRight<cr>", "Navigate Window Right"},
  },
}

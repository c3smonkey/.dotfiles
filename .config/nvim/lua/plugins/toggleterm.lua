require("config.c3s.globals")

local plugin = "toggleterm.nvim"

return {
  "akinsho/" .. plugin,
  --enabled = Is_Enabled(plugin),
  event = 'VeryLazy',
  version = "*",
  opts = {
    size = 13,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = "1",
    start_in_insert = true,
    persist_size = true,
    direction = "horizontal",
  },
  keys = {
    {"<leader>Tt", "<cmd>lua ToggleTerm.terminal()<cr>", "Terminal", desc = "Open [t]erminal" },
    {"<leader>Tg", "<cmd>lua ToggleTerm.lazygit()<cr>", "LazyGit", desc = "Open Lazy[g]it"},
    {"<leader>Tb", "<cmd>lua ToggleTerm.bpytop()<cr>", "bpytop", desc = "Open [b]pytop"},
    {"<leader>Tl", "<cmd>lua ToggleTerm.lf()<cr>", "lf", desc = "Open [l]f"},
  },
}

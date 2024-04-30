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
    {"<leader>Tg", "<cmd>lua ToggleTerm.lazygit()<cr>", "LazyGit"},
    {"<leader>Tb", "<cmd>lua ToggleTerm.bpytop()<cr>", "bpytop"},
    {"<leader>Tlf", "<cmd>lua ToggleTerm.lf()<cr>", "lf"},
  },
}

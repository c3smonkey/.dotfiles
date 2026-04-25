require("config.c3s.globals")

local plugin = "yazi.nvim"

return {
  "DreamMaoMao/" .. plugin,
  enabled = Is_Enabled(plugin),
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },

  keys = {
    { "<leader>Ty", "<cmd>Yazi<CR>", desc = "Open [y]azi" },
  },
}

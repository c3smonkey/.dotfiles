-- A code outline window for skimming and quick navigation
-- https://github.com/stevearc/aerial.nvim
return {
  'stevearc/aerial.nvim',
  opts = {},
  keys = {
    { "<leader>as", ":AerialToggle<CR>", mode = { "n", "v" }, desc = "Toggle [a]erial ([s]ymbol outline)" },
    { "<leader>an", ":AerialNavToggle<CR>", mode = { "n", "v" }, desc = "Toggle [a]erial [n]avigation (symbol outline)" },
  },
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
} 

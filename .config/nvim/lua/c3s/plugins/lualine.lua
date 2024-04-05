return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        -- INFO: For more themes see: https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        -- theme = "dracula",
        -- theme = "gruvbox",
        -- theme = "gruvbox",
        theme = "nord",
      },
    })
  end,
}

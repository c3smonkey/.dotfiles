return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        -- NOTE: For more themes see: https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        --theme = "codedark",
        --theme = "dracula",
        -- theme = "gruvbox",
        theme = "nord",
        --theme = "nightfly",
        --theme = "ayu_dark",
        -- theme = "molokai",
        -- theme = "iceberg_dark",
        --theme = "base16",
      },
    })
  end,
}

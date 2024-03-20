return {
  {
    "catppuccin/nvim", -- Add the Catppuccin plugin
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha") -- Set the Catppuccin flavor to "mocha"
    end,
  },
  {
    "bluz71/vim-nightfly-guicolors",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("nightfly")
    end,
  },
}

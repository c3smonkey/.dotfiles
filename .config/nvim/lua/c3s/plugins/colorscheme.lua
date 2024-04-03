return {
  {
    "Pocco81/Catppuccino.nvim",
    priority = 1002, -- highest priority
    init = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "bluz71/vim-nightfly-guicolors",
    priority = 1001,
    init = function()
      vim.cmd.colorscheme("nightfly")
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("tokyonight-night")
      vim.cmd.hi("Comment gui=none")
    end,
  },
}

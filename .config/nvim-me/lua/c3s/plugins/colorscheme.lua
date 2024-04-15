return {
  -- the order of the colorscheme is important, the first one has the highest priority
  -- INFO: if you want set it explicitly, you can set it in the lua.init file
  {
    "Pocco81/Catppuccino.nvim",
    priority = 1002,
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
  {
    "loctvl842/monokai-pro.nvim",
    priority = 999,
    init = function()
      vim.cmd.colorscheme("monokai-pro-spectrum")
    end,
  },
}

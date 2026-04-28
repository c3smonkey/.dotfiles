vim.pack.add({
  'https://github.com/folke/which-key.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/christoomey/vim-tmux-navigator',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/kdheepak/lazygit.nvim',
})

-- ╭──────────────────────╮
-- │  Konfigurationen     │
-- ╰──────────────────────╯
require("plugins.whichkey")
require("plugins.fzflua")

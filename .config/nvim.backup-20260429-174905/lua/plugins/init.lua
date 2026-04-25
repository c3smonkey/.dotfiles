vim.pack.add({
  -- LSP (using native Neovim 0.11+ vim.lsp.config)
  'https://github.com/williamboman/mason.nvim',
  
  -- Completion (nvim-cmp)
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/hrsh7th/cmp-buffer',
  'https://github.com/hrsh7th/cmp-path',
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/saadparwaiz1/cmp_luasnip',
  
  -- DAP (Debugging)
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/rcarriga/nvim-dap-ui',
  'https://github.com/nvim-neotest/nvim-nio',
  
  -- Utilities
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/christoomey/vim-tmux-navigator',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/kdheepak/lazygit.nvim',
})

-- ╭──────────────────────╮
-- │  Konfigurationen     │
-- ╰──────────────────────╯
require("plugins.whichkey")
require("plugins.fzf")
require("plugins.mini")
require("plugins.completion")  -- nvim-cmp
require("plugins.lsp")
require("plugins.dap")

-- Any files inside the lua/plugins directory will also
-- automatically be sourced. These plugins are those that
-- do not require any configuration.
return {
  -- tmux integration
  { "christoomey/vim-tmux-navigator" },
  -- Heuristically set buffer options (tabstop, shiftwidth, ...)
  { "tpope/vim-sleuth" },
  -- Surroundings (alternative to surround.vim)
  { "machakann/vim-sandwich" },
  -- LSP etc (configs in lua/lsp/...
  { "williamboman/mason.nvim" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason-lspconfig.nvim" },
  { "lukas-reineke/lsp-format.nvim" },
  -- Useful status updates for LSP
  { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
  -- Snippets
  { "hrsh7th/vim-vsnip" },
  { "rafamadriz/friendly-snippets" },
  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "onsails/lspkind.nvim" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-cmdline" },
  -- -- -- { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-vsnip" },
}

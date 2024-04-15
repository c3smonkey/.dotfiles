-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.
return {
  'stevearc/oil.nvim',
  opts = {},
  keys = {
    { "-", ":Oil<CR>", mode = { "n" }, desc = "Open parent directory" },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

return {
  "terrortylor/nvim-comment",
  lazy = false, -- default keybindings (gcc etc.) will not work otherwise
  keys = {
    { "<leader>/", ":CommentToggle<CR>", mode = { "n", "v" }, desc = "Toggle comment" }
  },
  config = function()
    require("nvim_comment").setup()
  end
}

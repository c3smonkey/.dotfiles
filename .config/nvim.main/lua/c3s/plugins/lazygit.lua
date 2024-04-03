return {

  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").load_extension("lazygit")

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>g", "<cmd>LazyGit<cr>", { silent = true, desc = "Open LazyGit" })
  end,
}

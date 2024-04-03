return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup()

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { silent = true, desc = "Git preview hunk" })
    keymap.set(
      "n",
      "<leader>gt",
      ":Gitsigns toggle_current_line_blame<CR>",
      { silent = true, desc = "Git toggle current line blame" }
    )
  end,
}

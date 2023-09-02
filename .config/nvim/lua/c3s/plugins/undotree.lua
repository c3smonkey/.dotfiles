return {
  "mbbill/undotree",

  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>uh", "<cmd>UndotreeToggle<cr>", { desc = "Undotree visualizes the undo history" })
  end,
}

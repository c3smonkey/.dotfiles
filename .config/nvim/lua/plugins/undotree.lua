return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>uh", "<cmd>UndotreeToggle<cr>", { desc = "Undotree visualizes the undo history" })
  end,
}

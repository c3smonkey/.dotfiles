return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set('n', '<leader>uh', "<CMD>UndotreeToggle<CR>", { desc = 'Toggle [U]ndo [H]istory' })
  end,
}

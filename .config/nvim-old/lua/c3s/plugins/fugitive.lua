return {
  "tpope/vim-fugitive",
  config = function()
    vim.cmd([[
      augroup fugitive
        autocmd!
        autocmd FileType fugitive setlocal bufhidden=delete
      augroup END
    ]])

    -- set keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>ga", "<cmd>Git blame<cr>", { silent = true, desc = "Git blame" })
    keymap.set("n", "gq", "<cmd>Git blame quite<cr>", { silent = true, desc = "Git blame quite" })
  end,
}

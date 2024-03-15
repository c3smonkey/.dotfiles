return {
  "tpope/vim-fugitive",
  config = function()
    vim.cmd([[
      augroup fugitive
        autocmd!
        autocmd FileType fugitive setlocal bufhidden=delete
      augroup END
    ]])

    -- Add key mapping for <leader>ga to run :Git blame
    vim.api.nvim_set_keymap("n", "<leader>ga", ":Git blame<CR>", { noremap = true, silent = true })
  end,
}

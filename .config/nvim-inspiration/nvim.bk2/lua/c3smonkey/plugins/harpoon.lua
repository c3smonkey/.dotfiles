return {
  "ThePrimeagen/harpoon",
  event = 'VimEnter',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.keymap.set('n', '<leader>ha',"<CMD>lua require('harpoon.mark').add_file()<CR>" , { desc = '[h]arpoon M[a]rk' })
    vim.keymap.set('n', '<leader>hn',"<CMD>lua require('harpoon.ui').nav_next()<CR>" , { desc = '[h]arpoon [n]ext Mark' })
    vim.keymap.set('n', '<leader>hp',"<CMD>lua require('harpoon.ui').nav_prev()<CR>" , { desc = '[h]arpoon [p]revious Mark' })
	vim.keymap.set('n', '<leader>ht',"<CMD>lua require('harpoon.term').gotoTerminal(1)<CR>" , { desc = '[h]arpoon [t]erminal' })
  end,
}

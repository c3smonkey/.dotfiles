return {
  "ThePrimeagen/harpoon",
  event = 'VimEnter',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.keymap.set('n', '<leader>hm',"<CMD>lua require('harpoon.mark').add_file()<CR>" , { desc = '[H]arpoon [M]ark' })
    vim.keymap.set('n', '<leader>hn',"<CMD>lua require('harpoon.ui').nav_next()<CR>" , { desc = '[H]arpoon [N]ext Mark' })
    vim.keymap.set('n', '<leader>hp',"<CMD>lua require('harpoon.ui').nav_prev()<CR>" , { desc = '[H]arpoon [P]revious Mark' })
	vim.keymap.set('n', '<leader>ht',"<CMD>lua require('harpoon.term').gotoTerminal(1)<CR>" , { desc = '[H]arpoon [T]erminal' })
  end,
}

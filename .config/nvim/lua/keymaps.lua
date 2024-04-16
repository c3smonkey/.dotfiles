-- nvim/lua/keymaps.lua

-- source optional configuration
vim.keymap.set("n", "<leader>so", "<CMD>so $MYVIMRC<CR>", { desc = "Source [O]ptional Configuration" })

-- exit insert mode with jj
vim.keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- open Explorer
vim.keymap.set("n", "<leader>ep", "<CMD>Ex <CR>", { desc = "[e]x[p]lorer" })


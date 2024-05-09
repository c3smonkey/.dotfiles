vim.keymap.set("n", "<leader>h", ":bp<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>l", ":bn<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "<leader>sl", ":vsplit<CR>", { desc = "Split vertically"})
vim.keymap.set("n", "<leader>sj", ":split<CR>", { desc = "Split horizontally"})
vim.keymap.set("n", "<leader>wc", "<C-w>c", { desc = "Close window"})

vim.keymap.set("n", "<leader>c", ":bd<CR>", { desc = "Close buffer"})

vim.keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix"})
vim.keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "Close quickfix"})
vim.keymap.set("n", "<leader>qn", ":cnext<CR>", { desc = "Go to next quickfix item"})
vim.keymap.set("n", "<leader>qp", ":cprevious<CR>", { desc = "Go to previous quickfix item"})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>p", [["+p]], { desc = "Paste from system clipboard" })

-- keep lines centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous match" })

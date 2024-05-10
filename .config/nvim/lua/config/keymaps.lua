-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Tab>", "<cmd>bn<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<cr>")

vim.keymap.set("n", "*", "*zz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- folds
vim.keymap.set("n", "<leader>z", "<cmd>normal! zMzv<cr>", { desc = "Fold all others" })

-- lsp
vim.api.nvim_set_keymap(
        "n",
        "<leader><space>",
        "<cmd>lua vim.lsp.buf.code_action()<CR>",
        { noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "[s]earch [h]elp" })
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "[s]earch [k]eymaps" })
vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "[s]earch [f]iles" })
vim.keymap.set("n", "<leader>ss", "<cmd>Telescope builtin<cr>", { desc = "[s]earch [s]elect Telescope" })
vim.keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "[s]earch current [w]ord" })
vim.keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "[s]earch by [g]rep" })
vim.keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "[s]earch [d]iagnostics" })
vim.keymap.set("n", "<leader>sr", "<cmd>Telescope resume<cr>", { desc = "[s]earch [r]esume" })
vim.keymap.set("n", "<leader>s.", "<cmd>Telescope oldfiles<cr>", { desc = '[s]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "[ ] Find existing buffers" })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>snf", function()
    require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[s]earch [n]eovim [f]iles" })


-- buffer
vim.keymap.set(
        "n",
        "<leader>bb",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        { desc = "Telescope buffers" }
)

-- line numbers
vim.keymap.set("n", "<leader>l", "<cmd>set number!<cr>", { desc = "Toggle line number" })

-- clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- gen
vim.keymap.set("v", "<leader>]", "<cmd>Gen<CR>")
vim.keymap.set("n", "<leader>]", "<cmd>Gen<CR>")

vim.keymap.set("v", "<C-s>", "<cmd>sort<CR>") -- Sort highlighted text in visual mode with Control+S
vim.keymap.set("v", "<leader>rr", '"hy:%s/<C-r>h//g<left><left>') -- Replace all instances of highlighted words
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move current line down
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- Move current line up

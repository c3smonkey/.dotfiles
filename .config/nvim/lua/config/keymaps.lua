-- keymaps.lua

-- Exit insert mode with
vim.keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- -- Re-select previous visual selection when pressing "<", ">" in visual mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Re-select previous visual selection [<]" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Re-select next visual selection [>]" })

-- Clear search highlight on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight [ESC]" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit Window [V]ertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit Window [H]orizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make [S]plits [E]qual Size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<CMD>close<CR>", { desc = "Close[X] Current [S]plit" }) -- close current split window

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move current line down/up
-- IntelliJ IDEA style - with Alt + Shift + Arrow
vim.api.nvim_set_keymap(
  "n",
  "<A-S-Down>",
  ":m +1<CR>",
  { noremap = true, silent = true, desc = "Move current line down" }
)
vim.api.nvim_set_keymap("n", "<A-S-Up>", ":m -2<CR>", { noremap = true, silent = true, desc = "Move current line up" })
-- Move current line down (Insert mode, IntelliJ IDEA style)
vim.api.nvim_set_keymap(
  "i",
  "<A-S-Down>",
  "<Esc>:m +1<CR>gi",
  { noremap = true, silent = true, desc = "Move current line down" }
)
-- Move current line up (Insert mode, IntelliJ IDEA style)
vim.api.nvim_set_keymap(
  "i",
  "<A-S-Up>",
  "<Esc>:m -2<CR>gi",
  { noremap = true, silent = true, desc = "Move current line up" }
)
-- Move selected lines down (Visual mode, IntelliJ IDEA style)
vim.api.nvim_set_keymap(
  "v",
  "<A-S-Down>",
  ":move '>+1<CR>gv=gv",
  { noremap = true, silent = true, desc = "Move selected lines down" }
)
-- Move selected lines up (Visual mode, IntelliJ IDEA style)
vim.api.nvim_set_keymap(
  "v",
  "<A-S-Up>",
  ":move '<-2<CR>gv=gv",
  { noremap = true, silent = true, desc = "Move selected lines up" }
)

-- nvim/lua/c3smonkey/config/keymaps.lua

-- exit insert mode with jj
vim.keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })
-- exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-D><C-C>", { desc = "Exit terminal mode" })
-- open explorer
vim.keymap.set("n", "<leader>ep", "<CMD>Ex <CR>", { desc = "[e]x[p]lorer" })


-- NOTE: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move - arrows are disabled"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move - arrows are disabled"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move - arrows are disabled"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move - arrows are disabled"<CR>')


-- NOTE:IntelliJ IDEA style - with Alt + Shift + Arrow keys to move current line or selected lines
vim.api.nvim_set_keymap("n","<A-S-Down>",":m +1<CR>",{ noremap = true, silent = true, desc = "Move current line down" })
vim.api.nvim_set_keymap("n", "<A-S-Up>", ":m -2<CR>", { noremap = true, silent = true, desc = "Move current line up" })
vim.api.nvim_set_keymap("i","<A-S-Down>","<Esc>:m +1<CR>gi",{ noremap = true, silent = true, desc = "Move current line down" })
vim.api.nvim_set_keymap("i","<A-S-Up>","<Esc>:m -2<CR>gi",{ noremap = true, silent = true, desc = "Move current line up" })
vim.api.nvim_set_keymap("v","<A-S-Down>",":move '>+1<CR>gv=gv",{ noremap = true, silent = true, desc = "Move selected lines down"})
vim.api.nvim_set_keymap("v","<A-S-Up>",":move '<-2<CR>gv=gv",{ noremap = true, silent = true, desc = "Move selected lines up" })


-- re-select previous / next visual selection
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Re-select previous visual selection [<]" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Re-select next visual selection [>]" })
-- format whole buffer
vim.api.nvim_set_keymap("n", ",f", ":normal gg=G<CR>", { noremap = true, silent = true })
-- clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight [ESC]" })

-- scroll up / down
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll [U]p Center Cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll [D]own Centter Cursor" })

-- toggles paste mode, word wrap, spell checking
vim.api.nvim_set_keymap("n", "<C-p>", ":set paste!<CR>", { noremap = true, desc = "Toggle paste mode" })
vim.api.nvim_set_keymap("n", "<leader>w", ":set wrap! linebreak<CR>", { noremap = true, desc = "Toggle word wrap" })
vim.api.nvim_set_keymap("n","<C-]>",":set spell! spelllang=en_us<CR>",{ noremap = true, desc = "Toggle spell checking" })

--- NOTE: The following keymaps are for moving between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })



-------------------------------------------------------------------------------------------
--
-- Presentation Mode
--
--------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap("n","<Left>",":silent bp<CR> :redraw!<CR>",{ noremap = true, desc = "Move to the previous buffer" })
vim.api.nvim_set_keymap("n","<Right>",":silent bn<CR> :redraw!<CR>",{ noremap = true, desc = "Move to the next buffer" })
vim.api.nvim_set_keymap("n", "<leader><F5>", ":set relativenumber!  number!  showmode!  showcmd!  hidden!  ruler! <CR>", {
    noremap = true,desc = "Toggle [P]resentatin  [M]ode - display of relative line numbers, line numbers, mode, command, and hidden status",
})


-- Buffer management
-- jump to slides
vim.api.nvim_set_keymap("n", "<leader>n", ":enew<CR>", { noremap = true, desc = "Open a [n]ew empty buffer" })
vim.api.nvim_set_keymap("n", "<leader>l", ":bnext<CR>", { noremap = true, desc = "Move to the next buffer" })
vim.api.nvim_set_keymap("n", "<leader>h", ":bprevious<CR>", { noremap = true, desc = "Move to the previous buffer" })
vim.api.nvim_set_keymap("n", "<leader><leader>", "<C-^>", { noremap = true, desc = "Open the last buffer" })
vim.api.nvim_set_keymap("n","<leader>bd",":bd<CR>",{ noremap = true, desc = "[D]elete The Current [B]uffer And Move To The previous One" })
vim.api.nvim_set_keymap("n", "<leader>bD", ":bd!<CR>", { noremap = true, desc = "Force [B]uffer [D]elete" })
vim.api.nvim_set_keymap("n","<leader>bl",":ls<CR>",{ noremap = true, desc = "[L]ist All Open [B]uffers And Their Status" })



--- toilet
vim.api.nvim_set_keymap("n","<leader>1",":.!toilet -w 200 -f term -F border<CR>",{ noremap = true, desc = "Create Ascii border" })
vim.api.nvim_set_keymap("n","<leader>2",":.!toilet -w 200 -f standard<CR>",{ noremap = true, desc = "Create Ascii art font (standard)" })
vim.api.nvim_set_keymap("n","<leader>3",":.!toilet -w 200 -f small<CR>",{ noremap = true, desc = "Create Ascii art font (small)" })
--- others
vim.api.nvim_set_keymap("n", "<leader>4", ":normal 92i-<CR>", { noremap = true, desc = "Add a line of -" })								-- add a line of -
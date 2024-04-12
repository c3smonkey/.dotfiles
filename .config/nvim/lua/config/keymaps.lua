-- keymaps.lua

vim.keymap.set("n", "<leader>so", "<cmd>so $MYVIMRC<CR>", { desc = "Source [O]ptional Configuration" })									-- source optional configuration
vim.keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })																-- exit insert mode with jj
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Re-select previous visual selection [<]" })					-- re-select previous visual selection
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Re-select next visual selection [>]" })						-- re-select next visual selection
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight [ESC]" })											-- clear search highlight
vim.keymap.set("t", "<Esc><Esc>", "<C-D><C-C>", { desc = "Exit terminal mode" })														-- exit terminal mode
vim.api.nvim_set_keymap("n", ",f", ":normal gg=G<CR>", { noremap = true, silent = true }) 												-- format the whole file

-- NOTE: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')																		-- disable left arrow key
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')																		-- disable right arrow key
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')																			-- disable up arrow key
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')																		-- disable down arrow key

--- NOTE:IntelliJ IDEA style - with Alt + Shift + Arrow keys to move current line or selected lines
vim.api.nvim_set_keymap("n","<A-S-Down>",":m +1<CR>",{ noremap = true, silent = true, desc = "Move current line down" })				-- move current line down
vim.api.nvim_set_keymap("n", "<A-S-Up>", ":m -2<CR>", { noremap = true, silent = true, desc = "Move current line up" })					-- move current line up
vim.api.nvim_set_keymap("i","<A-S-Down>","<Esc>:m +1<CR>gi",{ noremap = true, silent = true, desc = "Move current line down" })			-- move current line down
vim.api.nvim_set_keymap("i","<A-S-Up>","<Esc>:m -2<CR>gi",{ noremap = true, silent = true, desc = "Move current line up" })				-- move current line up
vim.api.nvim_set_keymap("v","<A-S-Down>",":move '>+1<CR>gv=gv",{ noremap = true, silent = true, desc = "Move selected lines down"})		-- move selected lines down
vim.api.nvim_set_keymap("v","<A-S-Up>",":move '<-2<CR>gv=gv",{ noremap = true, silent = true, desc = "Move selected lines up" })		-- move selected lines up


--------------------------------------------------------------------------------------------
--
-- Window management
--
--------------------------------------------------------------------------------------------
vim.keymap.set("n", "<C-S-left>", "<CMD>vertical resize +3<CR>", { desc = "Ctrl+Shift+Left Resize Vertical Split" })					-- Resize windows with Ctrl + Arrow keys
vim.keymap.set("n", "<C-S-Right>", "<CMD>vertical resize -3<CR>", { desc = "Ctrl+Shift+Right Resize Vertical Split" })					-- Resize windows with Ctrl + Arrow keys
vim.keymap.set("n", "<C-S-Up>", "<CMD>resize +3<CR>", { desc = "Ctrl+Shift+Up Resize Horizontal Split" })								-- Resize windows with Ctrl + Arrow keys
vim.keymap.set("n", "<C-S-Down>", "<CMD>resize -3<CR>", { desc = "Ctrl+Shift+Down Resize Horizontal Split" })							-- Resize windows with Ctrl + Arrow keys
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll [U]p Center Cursor" })															-- scroll up
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll [D]own Centter Cursor" })														-- scroll down
--- NOTE: The following keymaps are for moving between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })													-- Move focus to the left window  [h]
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })													-- Move focus to the right window [l]
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })													-- Move focus to the lower window [j]
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })													-- Move focus to the upper window [k]

-- vim.keymap.set("n", "<leader>|", "<C-w>v", { desc = "[S]plit Window [V]ertically" }) -- split window vertically
-- vim.keymap.set("n", "<leader>-", "<C-w>s", { desc = "[S]plit Window [H]orizontally" }) -- split window horizontally
-- vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make [S]plits [E]qual Size" }) -- make split windows equal width & height
-- vim.keymap.set("n", "<leader>sx", "<CMD>close<CR>", { desc = "Close[X] Current [S]plit" }) -- close current split window


-------------------------------------------------------------------------------------------
--
-- Presentation Mode
--
--------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap("n","<Left>",":silent bp<CR> :redraw!<CR>",{ noremap = true, desc = "Move to the previous buffer" })			-- Move to the previous buffer
vim.api.nvim_set_keymap("n","<Right>",":silent bn<CR> :redraw!<CR>",{ noremap = true, desc = "Move to the next buffer" })
vim.api.nvim_set_keymap("n", "<leader><F5>", ":set relativenumber!  number!  showmode!  showcmd!  hidden!  ruler! <CR>", {
	noremap = true,desc = "Toggle [P]resentatin  [M]ode - display of relative line numbers, line numbers, mode, command, and hidden status",
})

-- Buffer management
-- jump to slides
vim.api.nvim_set_keymap("n", "<leader>t", ":enew<CR>", { noremap = true, desc = "Open a new empty buffer" })
vim.api.nvim_set_keymap("n", "<leader>l", ":bnext<CR>", { noremap = true, desc = "Move to the next buffer" })
vim.api.nvim_set_keymap("n", "<leader>h", ":bprevious<CR>", { noremap = true, desc = "Move to the previous buffer" })
vim.api.nvim_set_keymap("n", "<leader><leader>", "<C-^>", { noremap = true, desc = "Open the last buffer" })
vim.api.nvim_set_keymap("n","<leader>bd",":bd<CR>",{ noremap = true, desc = "[D]elete The Current [B]uffer And Move To The previous One" })
vim.api.nvim_set_keymap("n", "<leader>bD", ":bd!<CR>", { noremap = true, desc = "Force [B]uffer [D]elete" })
vim.api.nvim_set_keymap("n","<leader>bl",":ls<CR>",{ noremap = true, desc = "[L]ist All Open [B]uffers And Their Status" })
vim.api.nvim_set_keymap("n", "<C-p>", ":set paste!<CR>", { noremap = true, desc = "Toggle paste mode" })
vim.api.nvim_set_keymap("n", "<leader>w", ":set wrap! linebreak<CR>", { noremap = true, desc = "Toggle word wrap" })
vim.api.nvim_set_keymap("n","<C-]>",":set spell! spelllang=en_us<CR>",{ noremap = true, desc = "Toggle spell checking" })


--- toilet
vim.api.nvim_set_keymap("n","<leader>1",":.!toilet -w 200 -f term -F border<CR>",{ noremap = true, desc = "Create Ascii border" })
vim.api.nvim_set_keymap("n","<leader>2",":.!toilet -w 200 -f standard<CR>",{ noremap = true, desc = "Create Ascii art font (standard)" })
vim.api.nvim_set_keymap("n","<leader>3",":.!toilet -w 200 -f small<CR>",{ noremap = true, desc = "Create Ascii art font (small)" })
--- others
vim.api.nvim_set_keymap("n", "<leader>4", ":normal 92i-<CR>", { noremap = true, desc = "Add a line of -" })								-- add a line of -
--------------------------------------------------------------------------------------------
--
-- Diagnostics
--
--------------------------------------------------------------------------------------------
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })									-- go to previous diagnostic message
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })										-- go to next diagnostic message


-- Maven Add ,c keymap for building
-- TODO: Add more keymaps here
--keymap.set("n", ",c", ":lua require('maven-gradle').build_project()<CR>")
-- Maven Add ,R run spring boot app
--keymap.set("n", ",R", ":lua require('maven-gradle').run_project()<CR>")

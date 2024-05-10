-- nvim/lua/c3smonkey/config/keymaps.lua

-- ----------------------------------------------------------------------------------------------------
-- NOTE: Keymaps configuration
-- ----------------------------------------------------------------------------------------------------
-- NOTE: Basic Keymaps configuration
vim.keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })																-- exit insert mode with jk
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Re-select previous visual selection [<]" })					-- re-select previous visual selection
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Re-select next visual selection [>]" })						-- re-select next visual selection
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight [ESC]" })											-- clear search highlight
vim.keymap.set("t", "<Esc><Esc>", "<C-D><C-C>", { desc = "Exit terminal mode" })														-- exit terminal mode
vim.keymap.set('n', "<Leader>P", '<CMD>execute "normal! \\"0p"<CR>', { noremap = true, silent = true, desc = "[p]aste from register 0" }) -- paste from register 0

--- NOTE:IntelliJ IDEA style - with Alt + Shift + Arrow keys to move current line or selected lines
vim.api.nvim_set_keymap("n","<A-S-Down>",":m +1<CR>",{ noremap = true, silent = true, desc = "Move current line down" })				-- move current line down
vim.api.nvim_set_keymap("n", "<A-S-Up>", ":m -2<CR>", { noremap = true, silent = true, desc = "Move current line up" })					-- move current line up
vim.api.nvim_set_keymap("i","<A-S-Down>","<Esc>:m +1<CR>gi",{ noremap = true, silent = true, desc = "Move current line down" })			-- move current line down
vim.api.nvim_set_keymap("i","<A-S-Up>","<Esc>:m -2<CR>gi",{ noremap = true, silent = true, desc = "Move current line up" })				-- move current line up
vim.api.nvim_set_keymap("v","<A-S-Down>",":move '>+1<CR>gv=gv",{ noremap = true, silent = true, desc = "Move selected lines down"})		-- move selected lines down
vim.api.nvim_set_keymap("v","<A-S-Up>",":move '<-2<CR>gv=gv",{ noremap = true, silent = true, desc = "Move selected lines up" })		-- move selected lines up

-- NOTE: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')																		-- disable left arrow key
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')																		-- disable right arrow keykey
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')																			-- disable up arrow key
vim.keymap.set("n", "<down>", '<cmd>echo "Use k to move!!"<CR>')																		-- disable down arrow key

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })                                                                              -- Join lines
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll [u]p Center Cursor" })															-- scroll up
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll [d]own Centter Cursor" })														-- scroll down
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next search result" })                                                              -- Move to next search result
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to previous search result" })                                                          -- Move to previous search result

--- NOTE: The following keymaps are for moving between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })													-- Move focus to the left window  [h]
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })													-- Move focus to the right window [l]
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })													-- Move focus to the lower window [j]
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })													-- Move focus to the upper window [k]
-- vim.api.nvim_set_keymap("n", ",f", ":normal gg=G<CR>", { noremap = true, silent = true }) 												-- format the whole file
vim.keymap.set("n", ",fp", "gqap", { desc = "[f]ormat [p]aragraphs" })                                                                  -- format paragraphs
vim.keymap.set("x", ",fp", "gqa", { desc = "[f]ormat [p]aragraphs" })                                                                  -- format paragraphs

vim.api.nvim_set_keymap("n","<leader>wl",":Limelight!!<CR>",{ noremap = true, desc = "[w]riting - toggle [l]imelight" })                -- toggle limelight
vim.api.nvim_set_keymap("n","<leader>wg",":Goyo<CR>",{ noremap = true, desc = "[w]riting - toggle [g]oyo" })							-- toggle goyo
vim.api.nvim_set_keymap("n", "<leader>ww", ":set wrap! linebreak<CR>", { noremap = true, desc = "toggle [w]ord [w]rap" })


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
vim.api.nvim_set_keymap("n", "<leader>bn", ":enew<CR>", { noremap = true, desc = "Open a [n]ew empty [b]uffer" })
vim.api.nvim_set_keymap("n", "<leader>l", ":bnext<CR>", { noremap = true, desc = "Move to the next buffer" })
vim.api.nvim_set_keymap("n", "<leader>h", ":bprevious<CR>", { noremap = true, desc = "Move to the previous buffer" })
vim.api.nvim_set_keymap("n", "<leader>bl", "<C-^>", { noremap = true, desc = "Open the [l]ast [b]uffer" })
vim.api.nvim_set_keymap("n","<leader>bd",":bd<CR>",{ noremap = true, desc = "[d]elete The Current [b]uffer And Move To The previous One" })
vim.api.nvim_set_keymap("n", "<leader>bD", ":bd!<CR>", { noremap = true, desc = "Force [b]uffer [D]elete" })
vim.api.nvim_set_keymap("n","<leader>ba",":ls<CR>",{ noremap = true, desc = "List [a]ll Open [b]uffers And Their Status" })

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
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [d]iagnostic message" })									-- go to previous diagnostic message
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [d]iagnostic message" })										-- go to next diagnostic message


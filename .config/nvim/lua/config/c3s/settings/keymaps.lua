-- ----------------------------------------------------------------------------------------------------
-- NOTE: Keymaps configuration
-- ----------------------------------------------------------------------------------------------------
require("config.c3s.globals")

-- INFO: Edit and Exit Modes
Keymap("i", "jj", "<ESC>", { desc = "Exit insert mode with [j][j]" })
Keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight [ESC]" })
Keymap("t", "<Esc><Esc>", "<C-D><C-C>", { desc = "Exit terminal mode [ESC][ESC]" })
Keymap('n', "<leader>P", '<cmD>execute "normal! \\"0p"<CR>', { desc = "[p]aste from register 0" })
Keymap("n", "<leader>i", "<cmd>set list!<cr>", { desc = "Toggle [i]nvisible characters" })

-- INFO: Execute the current line of text as a shell command.
Keymap("n", "<localleader>E", [[0mMvg_"ky :exec "r!" getreg("k")<cr>]])
Keymap("v", "<localleader>E", [["ky :exec "r!" getreg("k")<cr>]])

-- INFO: Quit all and Save All
Keymap("n", "<C-q>", "<cmd>qall!<cr>")
Keymap("n", "<C-s>", "<cmd>wall!<cr>")

-- INFO: Format Buffer
Keymap("n", "<localleader>f", ":normal gg=G<CR>", { desc = "e[f]ormat entire buffer" })
Keymap("n", "<localleader>fp", "gqap", { desc = "[f]ormat [p]aragraphs" })
Keymap("x", "<localleader>fp", "gqa", { desc = "[f]ormat [p]aragraphs" })
Keymap("n", "<leader>ww", ":set wrap! linebreak<CR>", { noremap = true, desc = "toggle [w]ord [w]rap" })
Keymap("n", "<leader>so", [[<cmd>luafile %<cr><cmd>echo "Sourced " . @%<cr>]])
Keymap("n", "<leader>l", "<cmd>set number!<cr> <cmd>set relativenumber!<cr>", { desc = "toggle [l]ine number" })


-- INFO: Select entire buffer
Keymap("n", "vaa", "ggvGg_", { desc = "Select entire buffer" })
Keymap("n", "Vaa", "ggVG", { desc = "Select entire buffer" })
Keymap("n", "<leader>VV", "V`]", { desc = "Linewise reselection" })

-- INFO: Stay in indent mode.
Keymap("v", "<", "<gv", { desc = "Re-select previous visual selection [<]" })
Keymap("v", ">", ">gv", { desc = "Re-select next visual selection [>]" })
-- INFO: Keep the cursor in place while joining lines.
Keymap("n", "J", "mzJ`z", { desc = "Join lines" })
Keymap("n", "<leader>J", "myvipJ`ygq<cr>", { desc = "Join current paragraph into a single line" })

-- INFO: Keep the cursor in place while scrolling
Keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll [u]p Center Cursor" })
Keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll [d]own Centter Cursor" })

-- INFO: Move to next search result
Keymap("n", "n", "nzzzv", { desc = "Move to next search result" })
Keymap("n", "N", "Nzzzv", { desc = "Move to previous search result" })

-- INFO: Alt + Shift + Arrow -  IntelliJ IDEA style move current line or selected lines
Keymap("n","<A-S-Down>",":m +1<CR>",{ desc = "Move current line down" })
Keymap("n","<A-S-Up>", ":m -2<CR>", { desc = "Move current line up" })
Keymap("i","<A-S-Down>","<Esc>:m +1<CR>gi",{ desc = "Move current line down" })
Keymap("i","<A-S-Up>","<Esc>:m -2<CR>gi",{ desc = "Move current line up" })
Keymap("v","<A-S-Down>",":move '>+1<CR>gv=gv",{ desc = "Move selected lines down"})
Keymap("v","<A-S-Up>",":move '<-2<CR>gv=gv",{ desc = "Move selected lines up" })

-- INFO: Disable arrow keys in normal mode
Keymap("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
Keymap("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
Keymap("n", "<down>", '<cmd>echo "Use k to move!!"<CR>')

-- INFO: The following keymaps are for moving between windows
Keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
Keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
Keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
Keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- INFO: Explorer / Project View
Keymap("n", "<leader>pv",  "<cmd>Lexplore<cr>", { desc = "[p]roject [v]iew" })
Keymap("n", "<leader>ee",  "<cmd>Ex<cr>", { desc = "[e]xplor[e]r" })

-- INFO: b - Buffer adjustments.
Keymap("n", "<leader>bc", "<cmd>bd<cr>", { desc = "[b]uffer [c]lose" })
Keymap("n", "<Right>",":silent bn<CR> :redraw!<CR>",{ desc = "[b]uffer [n]next" })
Keymap("n", "<Left>",":silent bp<CR> :redraw!<CR>",{ desc = "[b]uffer [p]revious" })
Keymap("n", "<leader>bh", "<cmd>vertical resize -1<cr>", { desc = "[b]uffer resize - h" })
Keymap("n", "<leader>bl", "<cmd>vertical resize +1<cr>", { desc = "[b]uffer resize - l" })
Keymap("n", "<leader>bj", "<cmd>resize +1<cr>", { desc = "[b]uffer resize - j" })
Keymap("n", "<leader>bk", "<cmd>resize -1<cr>", { desc = "[b]uffer resize - k" })
Keymap("n", "<leader><F5>", ":set relativenumber!  number!  showmode!  showcmd!  hidden!  ruler! <CR>", {
    noremap = true,desc = "Toggle [P]resentatin  [M]ode - display of relative line numbers, line numbers, mode, command, and hidden status",
})

-- INFO: toilet
Keymap("n","<leader>1",":.!toilet -w 200 -f term -F border<CR>",{ desc = "Create Ascii border" })
Keymap("n","<leader>2",":.!toilet -w 200 -f standard<CR>",{ desc = "Create Ascii art font (standard)" })
Keymap("n","<leader>3",":.!toilet -w 200 -f small<CR>",{ desc = "Create Ascii art font (small)" })


-- Shorten function name
local keymap = vim.keymap

keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<C-v>", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<C-s>", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<C-c>", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Maven Add ,c keymap for building
keymap.set("n", ",c", ":lua require('maven-gradle').build_project()<CR>")
-- Maven Add ,R run spring boot app
keymap.set("n", ",R", ":lua require('maven-gradle').run_project()<CR>")


--------------------------------------------------------------------------------------------
--
-- presentation mode
--
--------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap(
	"n",
	"<Left>",
	":silent bp<CR> :redraw!<CR>",
	{ noremap = true, desc = "Move to the previous buffer" }
)
vim.api.nvim_set_keymap(
	"n",
	"<Right>",
	":silent bn<CR> :redraw!<CR>",
	{ noremap = true, desc = "Move to the next buffer" }
)
vim.api.nvim_set_keymap(
	"n",
	"<F5>",
	":set relativenumber! number! showmode! showcmd! hidden! ruler!<CR>",
	{ noremap = true, desc = "Toggle display of relative line numbers, line numbers, mode, command, and hidden status" }
)

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

-- Buffer management
-- jumpt to slides
vim.api.nvim_set_keymap("n", "<leader>t", ":enew<CR>", { noremap = true, desc = "Open a new empty buffer" })
vim.api.nvim_set_keymap("n", "<leader>l", ":bnext<CR>", { noremap = true, desc = "Move to the next buffer" })
vim.api.nvim_set_keymap("n", "<leader>h", ":bprevious<CR>", { noremap = true, desc = "Move to the previous buffer" })
vim.api.nvim_set_keymap("n", "<leader><leader>", "<C-^>", { noremap = true, desc = "Open the last buffer" })
vim.api.nvim_set_keymap(
	"n",
	"<leader>bd",
	":bd<CR>",
	{ noremap = true, desc = "Close the current buffer and move to the previous one" }
)
vim.api.nvim_set_keymap("n", "<leader>BD", ":bd!<CR>", { noremap = true, desc = "Force buffer close" })
vim.api.nvim_set_keymap(
	"n",
	"<leader>bl",
	":ls<CR>",
	{ noremap = true, desc = "Show all open buffers and their status" }
)

vim.api.nvim_set_keymap("n", "<C-p>", ":set paste!<CR>", { noremap = true, desc = "Toggle paste mode" })
vim.api.nvim_set_keymap("n", "<leader>w", ":set wrap! linebreak<CR>", { noremap = true, desc = "Toggle word wrap" })
vim.api.nvim_set_keymap(
	"n",
	"<C-]>",
	":set spell! spelllang=en_us<CR>",
	{ noremap = true, desc = "Toggle spell checking" }
)



--- Add a line of '-'
vim.api.nvim_set_keymap("n", "<leader>a", ":normal 92i-<CR>", { noremap = true, desc = "Add a line of -" })


--- toilet
vim.api.nvim_set_keymap(
	"n",
	"<leader>3",
	":.!toilet -w 200 -f small<CR>",
	{ noremap = true, desc = "Create Ascii art font (small)" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>2",
	":.!toilet -w 200 -f standard<CR>",
	{ noremap = true, desc = "Create Ascii art font (standard)" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>1",
	":.!toilet -w 200 -f term -F border<CR>",
	{ noremap = true, desc = "Create Ascii border" }
)



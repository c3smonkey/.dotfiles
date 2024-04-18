---- nvim/lua/c3smonkey/config/options.lua

local opt = vim.opt

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 2

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.diagnostic.config {
    float = { border = "rounded" }, -- add border to diagnostic popups
}

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Disable the mouse while in nvim
opt.mouse = ""

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds




-- theprime
--vim.opt.guicursor = ""
--
--vim.opt.nu = true
--vim.opt.relativenumber = true
--
--vim.opt.tabstop = 4
--vim.opt.softtabstop = 4
--vim.opt.shiftwidth = 4
--vim.opt.expandtab = true
--
--vim.opt.smartindent = true
--
--vim.opt.wrap = false
--
--vim.opt.swapfile = false
--vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.undofile = true
--
--vim.opt.hlsearch = false
--vim.opt.incsearch = true
--
--vim.opt.termguicolors = true
--
--vim.opt.scrolloff = 8
--vim.opt.signcolumn = "yes"
--vim.opt.isfname:append("@-@")
--
--vim.opt.updatetime = 50
--
--vim.opt.colorcolumn = "80"



--
--vim.opt.clipboard = "unnamedplus"
--vim.opt.mouse = "a"
--
--vim.opt.number = true
--vim.opt.relativenumber = true
--vim.opt.colorcolumn = "200"
--vim.opt.cursorline = true
--vim.opt.scrolloff = 10
--vim.opt.sidescrolloff = 10
--vim.opt.signcolumn = "yes"
--vim.opt.wrap = false
--
--
--vim.opt.ignorecase = true
--vim.opt.smartcase = true
--vim.opt.hlsearch = true
--
--
--vim.opt.tabstop = 4
----vim.opt.shiftwidth = 4
--vim.opt.softtabstop = 8
--vim.opt.expandtab = false
--vim.opt.autoindent = true
--vim.opt.smartindent = true
--
--
--
--vim.opt.undofile = true
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.swapfile = false
--vim.opt.backup = false
--
--
--vim.opt.updatetime = 50
--vim.opt.timeoutlen = 300
--
--
--vim.opt.termguicolors = true
--vim.opt.guifont = "FiraCode Nerd Font:h17"
--
--
--vim.opt.spelllang = "en_us,de,de_ch"
--vim.opt.spell = true

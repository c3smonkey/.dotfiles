---- nvim/lua/c3smonkey/config/options.lua

-- ----------------------------------------------------------------------------------------------------
-- NOTE: Options Configuration
-- ----------------------------------------------------------------------------------------------------
vim.opt.fileencoding = "utf-8" -- set file encoding to UTF-8
vim.opt.termguicolors = true -- enable 24-bit RGB colors
vim.opt.guifont = "FiraCode Nerd Font:h17" -- set the font

vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
vim.opt.hlsearch = true -- highlight search results

vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true -- show line numbers

vim.opt.tabstop = 4 -- Set tab size to 4
vim.opt.shiftwidth = 4 -- Set indentation to 4
vim.opt.softtabstop = 8 -- Set softtabstop to 8
vim.opt.expandtab = false -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.textwidth = 180 -- set textwidth
vim.opt.breakindent = true -- enable break indent
--vim.opt.colorcolumn = 200															            -- NOTE: is set in smartcolumn.lua

vim.opt.mouse = "a" -- enable mouse support
vim.opt.swapfile = false -- disable swap files

vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.spelllang = "en_us,de,de_ch" -- set spell check language
vim.opt.spell = true -- enable spell check

vim.opt.showmode = false -- disable mode display
vim.opt.clipboard = "unnamedplus" -- sync clipboard between OS and Neovim
vim.opt.undofile = true -- enable undo file

vim.opt.list = true -- show listchars
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- set listchars

vim.opt.inccommand = "split" -- show live preview of substitution

vim.opt.cursorline = true -- highlight current line

vim.opt.scrolloff = 10 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 10 -- minimal number of screen columns to keep to the left and right of the cursor

vim.opt.signcolumn = "yes" -- always show sign column

vim.opt.updatetime = 250 -- option in Vim controls how often certain background tasks are performed
vim.opt.timeoutlen = 300 -- option determines the time Vim waits for a mapped key sequence to complete


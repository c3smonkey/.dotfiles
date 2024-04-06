-- settings.lua

-- ----------------------------------------------------------------------------------------------------
-- General
-- ----------------------------------------------------------------------------------------------------
-- Map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = false
-- Disable netrw banner
vim.g.loaded_netrw = 1
-- Disable netrw plugin
vim.g.loaded_netrwPlugin = 1
-- Disable netrw settings
vim.g.netrw_banner = 0
-- Set netrw to open in the same window
vim.g.netrw_altv = 1
-- Set netrw liststyle
vim.g.netrw_liststyle = 3
-- Set Nerd Font availability to true
vim.g.have_nerd_font = true
-- ----------------------------------------------------------------------------------------------------
-- Commands
-- ----------------------------------------------------------------------------------------------------
-- Enable filetype detection
vim.cmd("filetype plugin on")
-- Enable wildmenu
vim.cmd("set wildmenu")
vim.cmd("set path+=**")

-- ----------------------------------------------------------------------------------------------------
-- Options
-- ----------------------------------------------------------------------------------------------------
vim.opt.fileencoding = "utf-8" -- set file encoding to UTF-8
vim.opt.termguicolors = true -- enable 24-bit RGB colors
vim.opt.guifont = "FiraCode Nerd Font:h17" -- set the font
-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
-- Set line numbers
vim.opt.number = true
-- Set relative line numbers
vim.opt.relativenumber = true
-- shows absolute line number on cursor line (when relative number is on)
vim.opt.number = true
-- tabs & indentation
vim.opt.tabstop = 4 --  spaces for tabs (prettier default)
vim.opt.shiftwidth = 4 --  spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one
-- Enable mouse support
vim.opt.mouse = "a"
-- turn off swapfile
vim.opt.swapfile = false
-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom
-- Multi-language Spell Checking
vim.opt.spelllang = "en_us,de,de_ch"
vim.opt.spell = true
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- Minimal number of screen columns to keep to the left and to the right of the cursor.
vim.opt.sidescrolloff = 10
-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("c3s-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

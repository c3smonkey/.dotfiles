-- settings.lua

-- ----------------------------------------------------------------------------------------------------
-- General
-- ----------------------------------------------------------------------------------------------------
vim.g.mapleader = " "																			-- Map leader to space
vim.g.maplocalleader = " "
vim.g.loaded_netrwPlugin = 1																	-- Disable netrw
vim.g.netrw_banner = 0                                  										-- Disable netrw banner
vim.g.netrw_altv = 1                                    										-- Open netrw in a vertical split
vim.g.netrw_liststyle = 3																		-- Set netrw list style to tree
vim.g.have_nerd_font = true                             										-- Set to true if you have a Nerd Font installed
vim.g.loaded_matchit = 0                                										-- Disable matchit
-- ----------------------------------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------------------------------
-- Commands
-- ----------------------------------------------------------------------------------------------------
vim.cmd("filetype plugin on")																	-- Enable filetype detection
vim.cmd("set wildmenu")                                 										-- Enable enhanced command line completion
vim.cmd("set path+=**")                                 										-- Add recursive search to path

-- ----------------------------------------------------------------------------------------------------
-- Options
-- ----------------------------------------------------------------------------------------------------
-- NOTE: vim.opt.colorcolumn = "200"															-- set color column to 200 is set in smartcolumn.lua
vim.opt.fileencoding = "utf-8"                          										-- set file encoding to UTF-8
vim.opt.termguicolors = true                            										-- enable 24-bit RGB colors
vim.opt.guifont = "FiraCode Nerd Font:h17"              										-- set the font
vim.opt.ignorecase = true                               										-- ignore case when searching
vim.opt.smartcase = true                                										-- if you include mixed case in your search, assumes you want case-sensitive
vim.opt.hlsearch = true                                 										-- highlight search results
vim.opt.number = true                                   										-- show line numbers
vim.opt.relativenumber = true                           										-- show relative line numbers
vim.opt.number = true                                   										-- show line numbers
vim.opt.tabstop = 4                                     										-- Set tab size to 4
vim.opt.shiftwidth = 4                                  										-- Set indentation to 4
vim.opt.softtabstop = 8                                 										-- Set softtabstop to 8
vim.opt.expandtab = false                               										-- expand tab to spaces
vim.opt.autoindent = true                               										-- copy indent from current line when starting new one
vim.opt.mouse = "a"                                     										-- enable mouse support
vim.opt.swapfile = false                                										-- disable swap files
vim.opt.splitright = true                               										-- split vertical window to the right
vim.opt.splitbelow = true                               										-- split horizontal window to the bottom
vim.opt.spelllang = "en_us,de,de_ch"                    										-- set spell check language
vim.opt.spell = true                                    										-- enable spell check
vim.opt.showmode = false                                										-- disable mode display
vim.opt.clipboard = "unnamedplus"                       										-- sync clipboard between OS and Neovim
vim.opt.breakindent = true                              										-- enable break indent
vim.opt.undofile = true                                 										-- enable undo file
vim.opt.list = true                                     										-- show listchars
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }										-- set listchars
vim.opt.inccommand = "split"																	-- show live preview of substitution
vim.opt.cursorline = true                              											-- highlight current line
vim.opt.scrolloff = 10                                 											-- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 10                             											-- minimal number of screen columns to keep to the left and right of the cursor
vim.opt.signcolumn = "yes"																		-- always show sign column
vim.opt.updatetime = 250                               											-- decrease updatetime
vim.opt.timeoutlen = 300                               											-- decrease timeoutlen

vim.api.nvim_create_autocmd("TextYankPost", {          											-- highlight yanked text
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("c3s-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})


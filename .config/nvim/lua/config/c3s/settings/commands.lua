-- ----------------------------------------------------------------------------------------------------
-- NOTE: Command settings
-- ----------------------------------------------------------------------------------------------------
-- 
-- Enable filetype detection
vim.cmd("filetype plugin on")
-- Enable enhanced command line completion
vim.cmd("set wildmenu")
-- Add recursive search to path
vim.cmd("set path+=**")
-- enable 24-bit RGB colors in the terminal
vim.cmd [[set termguicolors]]
-- enable filetype detection, plugins, and indentation
vim.cmd([[filetype plugin indent on]])

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("c3s-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

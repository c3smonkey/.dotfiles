-- nvim/lua/c3smonkey/config/commands.lua

-- ----------------------------------------------------------------------------------------------------
-- NOTE: Command settings
-- ----------------------------------------------------------------------------------------------------
-- Enable filetype detection
vim.cmd("filetype plugin on")
-- Enable enhanced command line completion
vim.cmd("set wildmenu")
-- Add recursive search to path
vim.cmd("set path+=**")

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("c3s-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- nvim/lua/c3smonkey/config/commands.lua

vim.cmd("filetype plugin on")																	-- Enable filetype detection
vim.cmd("set wildmenu")                                 										-- Enable enhanced command line completion
vim.cmd("set path+=**")                                 										-- Add recursive search to path

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("c3s-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

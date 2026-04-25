-- ----------------------------------------------------------------------------------------------------
-- NOTE: Command settings
-- ----------------------------------------------------------------------------------------------------
-- 
vim.cmd("filetype plugin on")                               -- Enable filetype detection
vim.cmd("set wildmenu")                                     -- Enable enhanced command line completion
vim.cmd("set path+=**")                                     -- Add recursive search to path
vim.cmd [[set termguicolors]]                               -- enable 24-bit RGB colors in the terminal
vim.cmd([[filetype plugin indent on]])                      -- enable filetype detection, plugins, and indentation
vim.cmd([[hi Normal guifg=#bbbbbb guibg=NONE gui=NONE]])

vim.api.nvim_create_autocmd("TextYankPost", {               -- highlight yanked text
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("c3s-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {                  -- highlight yanked text
	pattern = { "aerospace.toml"},
	command = "!aerospace reload-config",
})

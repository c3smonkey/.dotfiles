-- nvim/lua/pluginlist.lua
return {
		{
				'numToStr/Comment.nvim',
				opts = {},
				lazy = false,
		},
		{ 
				"ellisonleao/gruvbox.nvim", 
				priority = 1000 ,
				config = function()
						vim.cmd("colorscheme gruvbox")
				end
		},
}

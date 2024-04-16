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
		{
				"dstein64/vim-startuptime",
				cmd = "StartupTime"
		},
		{
				'nvim-lualine/lualine.nvim',
				dependencies = { 'nvim-tree/nvim-web-devicons' },
				confg = function()
						require("lualine").setup({
								icons_enabled = true,
								theme = "gruvbox",

						})
				end,

		}
}

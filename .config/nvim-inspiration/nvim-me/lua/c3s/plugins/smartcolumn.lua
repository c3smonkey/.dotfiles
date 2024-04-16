return {
	{

		"m4xshen/smartcolumn.nvim",
		config = function()
			local smartcolumn = 	require("smartcolumn")
			smartcolumn.setup({
				disabled_filetypes = { "help" },
				enabled = true,
				colorcolumn = {  "200" }
			})
		end,
	},
}



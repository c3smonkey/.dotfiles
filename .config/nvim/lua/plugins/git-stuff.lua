return {
	{
		"tpope/vim-fugitive",
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
			vim.keymap.set("n", "<leader>g", "<cmd>LazyGit<cr>", { silent = true, desc = "Open LazyGit" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()

			local keymap = vim.keymap
			keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { silent = true, desc = "Git preview hunk" })
			keymap.set(
				"n",
				"<leader>gt",
				":Gitsigns toggle_current_line_blame<CR>",
				{ silent = true, desc = "Git toggle current line blame" }
			)
		end,
	},
}

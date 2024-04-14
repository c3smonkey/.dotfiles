return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
		vim.keymap.set("n", "<leader>mps", vim.cmd.MarkdownPreview, { desc = "[M]arkdown [P]review [S]art" }),
		vim.keymap.set("n", "<leader>mpS", vim.cmd.MarkdownPreviewStop, { desc = "[M]arkdown [P]review [S]top" })		
	}
}

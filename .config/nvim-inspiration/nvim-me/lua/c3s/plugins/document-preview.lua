return {
	{
		'tigion/nvim-asciidoc-preview',
		cmd = { 'AsciiDocPreview' },
		ft = { 'asciidoc' },
		build = 'cd server && npm install',
		opts = {
			-- Add user configuration here
		},
		vim.keymap.set("n", "<leader>ap", vim.cmd.AsciiDocPreview, { desc = "[A]sciiDoc [P]review" }),
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
		vim.keymap.set("n", "<leader>mps", vim.cmd.MarkdownPreview, { desc = "[M]arkdown [P]review [S]art" }),
		vim.keymap.set("n", "<leader>mpS", vim.cmd.MarkdownPreviewStop, { desc = "[M]arkdown [P]review [S]top" })		
	}

}

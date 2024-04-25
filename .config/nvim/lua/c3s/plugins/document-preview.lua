return {
    {
        "tigion/nvim-asciidoc-preview",
        cmd = { "AsciiDocPreview" },
        ft = { "asciidoc" },
        build = "cd server && npm install",
        opts = {
            -- Add user configuration here
        },
        vim.keymap.set("n", "<leader>ap", vim.cmd.AsciiDocPreview, { desc = "[a]sciiDoc [p]review" }),
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        vim.keymap.set("n", "<leader>mps", vim.cmd.MarkdownPreview, { desc = "[m]arkdown [p]review [s]art" }),
        vim.keymap.set("n", "<leader>mpS", vim.cmd.MarkdownPreviewStop, { desc = "[m]arkdown [p]review [s]top" }),
    },
}

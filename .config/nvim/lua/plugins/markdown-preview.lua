require("config.c3s.globals")

local plugin = "markdown-preview.nvim"

return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            if not Use_Default_Keys(plugin) then
                vim.keymap.set("n", "<leader>pms", vim.cmd.MarkdownPreview, { desc = "[p]review [m]arkdown [s]art" })
                vim.keymap.set("n", "<leader>pmS", vim.cmd.MarkdownPreviewStop, { desc = "[p]review [m]arkdown [S]top" })
            end
        end,
    },
}

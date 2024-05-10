return {
    "kdheepak/lazygit.nvim",
    event = 'VeryLazy',
    --event = {"BufEnter"},
    -- ft = "gitcommitd",
    enabled = true,
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Lazy[g]it [g]it" },
    },
}

return {
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },


    { -- LSP Configuration
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            {
                "antosha417/nvim-lsp-file-operations",
                config = true,
            },
            {
                "folke/neodev.nvim",
                opts = {},
            },
        },
    }

}

require("config.c3s.globals")

local plugin = "lsp-zero.nvim"


return {
    {
        "VonHeikemen/" .. plugin,
        enabled = Is_Enabled(plugin),
        branch = "v3.x",
        event = "InsertEnter",
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr }) -- see :help lsp-zero-keybindings
            end)
        end,
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.intelephense.setup({})
        end,
    },
    {
       "neovim/nvim-lspconfig",
       dependencies = {
           "hrsh7th/cmp-nvim-lsp",
       },
    }
}
require("config.c3s.globals")

local plugin = "lsp-zero.nvim"

return {
    {
        "VonHeikemen/" .. plugin, branch = 'v3.x',
        enabled = Is_Enabled(plugin),
        --event = "InsertEnter",
        event = "VeryLazy",
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' }
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "kotlin_language_server",
                    "marksman",
                    "gopls",
                },
            })


            -- LSP
            local lsp = require("lsp-zero")

            lsp.preset("recommended")

            lsp.ensure_installed({
                "tsserver",
                "gopls",
                "eslint",
            })

            lsp.set_preferences({
                sign_icons = {}
            })

            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gd", function()
                    vim.lsp.buf.definition()
                end, opts)
            end)

            lsp.setup()

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                    vim.lsp.diagnostic.on_publish_diagnostics, {
                        signs = false,
                        virtual_text = true,
                        underline = false,
                    }
            )

            --[[ local lsp_zero = require('lsp-zero')
             lsp_zero.on_attach(function(client, bufnr)
                 lsp_zero.default_keymaps({ buffer = bufnr })
             end)
             require('lsp-zero')
             require('lspconfig').intelephense.setup({})
             local lspconfig = require('lspconfig')
             lspconfig.gopls.setup({})]]


        end,
    },
    --{
    --	'neovim/nvim-lspconfig',
    --	event = "InsertEnter",
    --},
    --{
    --	'hrsh7th/cmp-nvim-lsp',
    --	event = "InsertEnter",
    --},
    --{
    --	'hrsh7th/nvim-cmp',
    --	event = "InsertEnter",
    --},
    --{
    --	'L3MON4D3/LuaSnip',
    --	event = "InsertEnter",
    --},
}




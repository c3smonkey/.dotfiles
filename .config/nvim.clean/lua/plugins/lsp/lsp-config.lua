return {
    { "hrsh7th/cmp-nvim-lsp" },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "html",
                    "yamlls",
                    "kotlin_language_server",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities

            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.kotlin_language_server.setup({
                cmd = { "kotlin-language-server" },
                root_dir = lspconfig.util.root_pattern("pom.xml", "settings.gradle", "settings.gradle.kts"),
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    local opts = { noremap = true, silent = true, buffer = bufnr }

                    -- Set keybinds
                    -- Show definition, references
                    opts.desc = "Show LSP references"
                    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
                    -- Go to declaration
                    opts.desc = "Go to declaration"
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    -- Go to definition
                    vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
                end,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
        end,
    },
}

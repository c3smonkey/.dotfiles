require("config.c3s.globals")

local plugin = "mason-lspconfig.nvim"

return {
    "williamboman/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = "BufRead",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "kotlin_language_server",
                "marksman",
                "gopls",
            },
            automatic_installation = true,
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "ktlint",
                "checkstyle",
                "delve",
                "markdownlint",
                "yaml-language-server",
                "json-lsp",
                "golangci-lint",
                "gofumpt",
                "goimports",
                "goimports-reviser",
                "gomodifytags",
            },
            automatic_installation = true,
        })
    end,
}

require("config.c3s.globals")

local plugin = "mason.nvim"

return {
    "williamboman/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = "BufRead",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            auto_install = true,
            ui = {
                border = "double",
                icons = {
                    package_installed = " ",
                    package_pending = "󰌚 ",
                    package_uninstalled = "󰢤 ",
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "kotlin_language_server",
                "gopls",

            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "ktlint",
                "delve"
            }
        })
    end,
}




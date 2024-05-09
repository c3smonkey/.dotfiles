return {
    { -- Autoformat
        "stevearc/conform.nvim",
        lazy = false,
        keys = {
            {
                ",f",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            notify_on_error = false,
            tab = true,
            use_tabs = true,
            tab_size = 4,
            ignore = {
                "markdown",
                -- "lua",
            },

            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                python = { "isort", "black" },
                go = { "gofmt" },
                kotlin = { "ktlint" },
                xml = { "xmllint --format --encode utf-8 --nsclean --noblanks --nocdata --nsclean --pretty 2" },
                rust = { "rustfmt" },
            },
        },
    },
}

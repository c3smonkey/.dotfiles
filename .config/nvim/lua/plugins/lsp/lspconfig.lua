require("config.c3s.globals")

local plugin = "nvim-lspconfig"

return {
    "neovim/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "jose-elias-alvarez/typescript.nvim",
        "hrsh7th/cmp-nvim-lsp",
        {
            "smjonas/inc-rename.nvim",
            config = true,
        },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
            callback = function(event)

                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("gd", require("telescope.builtin").lsp_definitions, "LSP: [g]oto [d]efinition")
                map("gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")
                map("gI", require("telescope.builtin").lsp_implementations, "[g]oto [I]mplementation")
                map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")
                map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[w]orkspace [s]ymbols")
                map("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
                map("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")
                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("<leader>rs", ":LspRestart<CR>", "[r]estart L[s]P")
                map("gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        lspconfig.lua_ls.setup({
            server = {
                capabilities = capabilities,
            },
        })
        lspconfig.gopls.setup({
            server = {
                capabilities = capabilities,
            },
        })
        lspconfig.kotlin_language_server.setup({
            server = {
                capabilities = capabilities,
            },
        })


    end,
}

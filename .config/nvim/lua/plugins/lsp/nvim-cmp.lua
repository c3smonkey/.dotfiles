require("config.c3s.globals")

local plugin = "nvim-cmp"

return {
    {
        "hrsh7th/" .. plugin,
        enabled = Is_Enabled(plugin),
        event = "InsertEnter",
        dependencies = {
            { "hrsh7th/cmp-buffer" }, -- source for text in buffer
            { "hrsh7th/cmp-path" }, -- source for file system paths
            { "hrsh7th/cmp-nvim-lsp" }, -- source for nvim lsp
            { "saadparwaiz1/cmp_luasnip" }, -- for autocompletion
            { "onsails/lspkind.nvim" }, -- vs-code like pictograms
            { "rafamadriz/friendly-snippets" }, -- useful snippets
            { "roobert/tailwindcss-colorizer-cmp.nvim", config = true }, --  vs-code-style TailwindCSS color hints t
        },

        config = function()
            -- configure tailwindcss-colorizer-cmp
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })

            local luasnip = require("luasnip")
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
                },
                snippet = { -- configure how nvim-cmp interacts with snippet engine
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                    --["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                    --["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
                    ["<Down>"] = cmp.mapping.scroll_docs(-4),
                    ["<Up>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),

                }),

                sources = cmp.config.sources({ -- sources for autocompletion
                    { name = 'copilot' }, -- copilot
                    { name = "nvim_lsp" }, -- nvim lsp
                    { name = "luasnip" }, -- snippets
                    { name = "buffer" }, -- text within current buffer
                    { name = "path" }, -- file system paths
                }),

                formatting = { -- configure lspkind for vs-code like pictograms in completion menu
                    format = lspkind.cmp_format({
                        maxwidth = 50,
                        ellipsis_char = "...",
                        --mode = 'symbol', -- show only symbol annotations
                    }),
                },
            })
        end
    },
  }

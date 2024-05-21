require("config.c3s.globals")

local plugin = "noice.nvim"

return {
    "folke/" .. plugin,
    event = "VeryLazy",
    enabled = Is_Enabled(plugin),
    keys = {
        { "<leader>ne", "<cmd>NoiceErrors<cr>" },
        { "<leader>nh", "<cmd>NoiceHistory<cr>" }
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        local status_ok, noice = pcall(require, "noice")

        if not status_ok then
            return
        end
        noice.setup({
            cmdline = {
                view = "cmdline",
            },
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                signature = {
                    enabled = false,
                },
                hover = {
                    enabled = false,
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
                bottom_search = false,
                command_palette = false,
            },
            messages = {
                enabled = false,
            },
        })

        require("notify").setup({
            -- background_color = "#ff0000",
            background_colour = "#000000",
        })

        Keymap("n", "<leader>nd", "<CMD>NoiceDismiss<CR>", { desc = "[n]oice [d]ismiss" })
    end,
    opts = function(_, opts)
        if Use_Default_Opts(plugin) then
            opts = opts
        else
            opts.cmdline = {
                enabled = true,
                --view = "cmdline",
                view = "cmdline_popup",
                opts = {
                    cmdline_popup = {
                        win_options = {
                            winblend = 0,
                        },
                        scrollbar = false,
                    },
                },
                format = {
                    cmdline = { pattern = "^:", icon = "$", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                    input = {},
                },
            }
            opts.commands = {
                all = {
                    view = "split",
                    opts = { enter = true, format = "details" },
                    filter = {},
                },
            }
            opts.lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            }
            opts.messages = {
                enabled = true,
                view = "mini",
                view_error = "mini",
                view_warn = "mini",
                view_history = "messages",
                view_search = "virtualtext",
            }
            opts.notify = {
                enabled = true,
                view = "notify"
            }
            opts.popupmenu = {
                enabled = true,
                backend = "nui",
                scrollbar = false,
                -- kind_icons = {},
            }
            opts.presets = {
                bottom_search = false,
                command_palette = false,
                long_message_to_split = false,
                inc_rename = true,
                lsp_doc_border = true,
            }
            opts.redirect = {
                view = "mini",
                filter = { event = "msg_show" },
            }
            opts.routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "echo",
                        any = {
                            { find = "Prompt" },
                            { find = "No lines in buffer" },
                            { find = "line" },
                            { find = "lines" },
                        },
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = "msg_show",
                        kind = "emsg",
                        any = {
                            { find = "E490: No fold found" },
                            { find = "E486: Pattern not found" },
                        },
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = "msg_show",
                        kind = "wmsg",
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = "notify",
                        kind = "No fold found",
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = "notify",
                        kind = "No information available",
                    },
                    opts = { skip = true },
                },

            }
            opts.views = {
                cmdline_popup = {
                  win_options = {
                    winblend = 0,
                  },
                  scrollbar = false,
                },

                mini = {
                    win_options = {
                        winblend = 0,
                    },
                    border = {
                        style = "none",
                        padding = { 0, 1 },
                    }
                },
            }
            -- --------------------------------------------------------------------- }}}
        end
    end,
}

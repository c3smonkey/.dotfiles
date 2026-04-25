require("config.c3s.globals")

local plugin = "lualine.nvim"

return {
    "nvim-lualine/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = "VeryLazy",
    opts = function(_, opts)
        if Use_Default_Opts(plugin) then
            opts = opts
        else


            local icons = require("config.c3s.functions.icons")

            local diagnostics = {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                sections = { "error", "warn", "info", "hint" },
                symbols = {
                    error = icons.diagnostics.Error,
                    hint = icons.diagnostics.Hint,
                    info = icons.diagnostics.Info,
                    warn = icons.diagnostics.Warn,
                },
                colored = true,
                update_in_insert = false,
                always_visible = false,
            }

            local diff = {
                "diff",
                symbols = {
                    added = icons.git.added .. " ",
                    untracked = icons.git.added .. " ",
                    modified = icons.git.changed .. " ",
                    removed = icons.git.deleted .. " ",
                },
                colored = true,
                always_visible = false,
                source = function()
                    local gitsigns = vim.b.gitsigns_status_dict
                    if gitsigns then
                        return {
                            added = gitsigns.added,
                            modified = gitsigns.changed,
                            removed = gitsigns.removed,
                        }
                    end
                end,
            }


            local progress = {
                "progress",
                color = {
                    fg = '#524B88',
                    bg = 'none',
                }
            }
            local location = {
                "location",
                color = {
                    fg = '#524B88',
                    bg = 'none',
                }
            }
            local fileformat = {
                "fileformat",
                color = {
                    fg = '#524B88',
                    bg = 'none',
                }
            }
            local filetype = {
                "filetype",
                color = {
                    fg = '#524B88',
                    bg = 'none',
                }
            }
            local encoding = {
                "encoding",
                color = {
                    fg = '#524B88',
                    bg = 'none',
                }
            }
            local filename = {
                "filename",
                color = {
                    fg = '#524B88',
                    bg = 'none',
                }
            }
            local mode = {
                "mode",
                colored = true,
                fmt = string.upper,
                always_visible = false,
                color = {
                    gui = 'none',
                    fg = '#524B88',
                    bg = 'none',
                },
            }

            return {
                options = {
                    theme = "auto",
                    globalstatus = true,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
                },
                sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { diff, diagnostics },
                    lualine_x = { filename, progress, location, fileformat, encoding },
                    lualine_y = { filetype },
                    lualine_z = { mode },
                },
            }

        end
    end,
}



--require("config.c3s.globals")
--
--local plugin = "lualine.nvim"
--
--return {
--  "nvim-lualine/" .. plugin,
--  event = 'VeryLazy',
--  enabled = Is_Enabled(plugin),
--  opts = function(_, opts)
--    if Use_Default_Opts(plugin) then
--      opts = opts
--    else
--      opts.options = {
--        icons_enabled = true,
--        theme = "nightfly",
--        component_separators = { left = "", right = "" },
--        section_separators = { left = "", right = "" },
--        disabled_filetypes = {
--          winbar = {},
--          statusline = { "alpha", "dashboard" },
--        },
--        ignore_focus = {},
--        always_divide_middle = true,
--        globalstatus = false,
--        refresh = {
--          statusline = 1000,
--          tabline = 1000,
--          winbar = 1000,
--        },
--      }
--
--      opts.sections = {
--        lualine_a = { "mode" },
--        lualine_b = { "branch", "diff", "diagnostics" },
--        lualine_c = { "filename" },
--        lualine_x = { "encoding", "fileformat", "filetype", "filesize" },
--        lualine_y = { "progress" },
--        lualine_z = { "location" },
--      }
--
--      opts.inactive_sections = {
--        lualine_a = {},
--        lualine_b = {},
--        lualine_c = { "filename" },
--        lualine_x = { "location" },
--        lualine_y = {},
--        lualine_z = {},
--      }
--
--      opts.tabline = {}
--      opts.winbar = {}
--      opts.inactive_winbar = {}
--      opts.extensions = {}
--    end
--  end,
--}

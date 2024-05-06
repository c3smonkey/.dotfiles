require("config.c3s.globals")

local name = "catppuccin"
local plugin = "nvim"

return {
    name .. "/" .. plugin,
    enabled = Is_Enabled(name),
    --"catppuccin/nvim",
    name = "catppuccin",
    init = function()
        vim.cmd.colorscheme("catppuccin")
        vim.cmd.hi("Comment gui=none")
    end,
    priority = 2000,
    ---@class CatppuccinOptions
    opts = function()
        -- TODO: generate dynamics colors
        local theme_colors = require("config.c3s.colors")
        return {
            flavour = "mocha",
            transparent_background = true,
            color_overrides = { all = theme_colors },
            custom_highlights = function(colors)
                return {
                    CurSearch = { bg = colors.yellow },
                    GitSignsChange = { fg = colors.blue },
                }
            end,
            integrations = {
                cmp = true,
                fidget = true,
                gitsigns = true,
                harpoon = true,
                lsp_trouble = true,
                mason = true,
                neotest = true,
                noice = true,
                notify = true,
                octo = true,
                telescope = {
                    enabled = true,
                },
                treesitter = true,
                treesitter_context = false,
                symbols_outline = true,
                illuminate = true,
                which_key = true,
                barbecue = {
                    dim_dirname = true,
                    bold_basename = true,
                    dim_context = false,
                    alt_background = false,
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                },
            },
        }
    end,
}
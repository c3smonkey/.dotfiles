require("config.c3s.globals")

local plugin = "gitsigns.nvim"

return {
    "lewis6991/" .. plugin,
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(plugin),
    -- ft = "gitcommit",

    opts = function(_, opts)
        if Use_Default_Opts(plugin) then
            opts = opts
        else
            --TODO: configurable via customizer
            opts.signs = {
                --[[ add = { text = "▎" },
                 change = { text = "▎" },
                 changedelete = { text = "▎" },
                 delete = { text = '_' },
                 topdelete = { text = '‾' },
                 untracked = { text = "▎" },]]

                add = { text = "" },
                change = { text = "" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "" },
                untracked = { text = "" },
            }
            opts.current_line_blame = true
            opts.current_line_blame_formatter = " <author>, <author_time:%Y-%m-%d> - <summary>"
            opts.trouble = false

            if not Use_Default_Keys(plugin) then
                opts.on_attach = function(buffer)
                    local gs = package.loaded.gitsigns

                    local function map(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
                    end

                    local function map(mode, l, r, desc)
                        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                    end

                    map({ "n", "v" }, "<leader>gx", ":Gitsigns reset_hunk<CR>", "[g]it Reset Hunk")
                    map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "[g]it [s]tage Hunk")
                    map("n", "<leader>gS", gs.stage_buffer, "[g]it [S]tage Buffer")
                    map("n", "<leader>gh", gs.preview_hunk, "[g]it Preview [h]unk")
                    map("n", "<leader>gu", gs.undo_stage_hunk, "[g]it [u]ndo Stage Hunk")
                    map("n", "<leader>gX", gs.reset_buffer, "[g]it Reset Buffer")
                    map("n", "<leader>gp", gs.preview_hunk, "[g]it [p]review Hunk")

                    map("n", "<leader>gb", function()
                        gs.blame_line({ full = true })
                    end, "[g]it [b]lame Line")

                    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")

                    map("n", "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", "[g]it [t]oggle blame line")

                end
            end
        end
    end,
    keys = {
        -- git hunk navigation - previous / next
        { "gh", ":Gitsigns next_hunk<CR>", desc = "Goto next git hunk" },
        { "gH", ":Gitsigns prev_hunk<CR>", desc = "Goto previous git hunk" },
        { "]g", ":Gitsigns next_hunk<CR>", desc = "Goto next git hunk" },
        { "[g", ":Gitsigns prev_hunk<CR>", desc = "Goto previous git hunk" },
    },

    config = function(_, opts)
        require('gitsigns').setup(opts)
    end,
}

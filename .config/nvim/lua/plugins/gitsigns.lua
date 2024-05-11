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
                add = { text = "▎" },
                change = { text = "▎" },
                changedelete = { text = "▎" },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                untracked = { text = "▎" },
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

                    map("n", "]h", gs.next_hunk, "Next hunk")
                    map("n", "[h", gs.prev_hunk, "Prev hunk")

                    map("n", "<leader>gB", function()
                        gs.blame_line({ full = true })
                    end, "[g]it [B]lame line full")
                    map("n", "<leader>gbl", gs.blame_line, "[g]it [b]lame [l]ine")

                    map({ "n", "v" }, "<leader>gR", gs.reset_hunk, "[g]it [R]eset hunk")
                    map({ "n", "v" }, "<leader>gh", gs.stage_hunk, "[g]it stage [h]unk")
                    map("n", "<leader>gH", gs.undo_stage_hunk, "[g]it undo stage [H]unk")

                    map("n", "<leader>gp", gs.preview_hunk, "[g]it [p]review hunk")
                    map("n", "<leader>gr", gs.reset_buffer, "[g]it [r]eset buffer")

                    map({"x", "o"}, "ih", "<cmd><C-U>Gitsigns select_hunk<cr>", "Gitsigns Select Hunk")

                    map("n", "<leader>gt","<cmd>Gitsigns toggle_current_line_blame<cr>", "[g]it [t]oggle blame line")


                end
            end
        end
    end,

    config = function(_, opts)
        require('gitsigns').setup(opts)
    end,
}



-- from josh
-- cSpell:words gitsigns nvim topdelete changedelete keymap stylua diffthis
--return {
--    "lewis6991/gitsigns.nvim",
--    event = "BufReadPre",
--    opts = function()
--        -- local icons = require("config.icons")
--        --- @type Gitsigns.Config
--        local C = {
--            signs = {
--                add = { text = "" },
--                change = { text = "" },
--                delete = { text = "" },
--                topdelete = { text = "" },
--                changedelete = { text = "" },
--                untracked = { text = "" },
--            },
--            on_attach = function(buffer)
--                local gs = package.loaded.gitsigns
--
--                local function map(mode, l, r, desc)
--                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
--                end
--
--                map({ "n", "v" }, "<leader>gx", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
--                map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
--                map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
--                map("n", "<leader>gh", gs.preview_hunk, "Preview Hunk")
--                map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
--                map("n", "<leader>gX", gs.reset_buffer, "Reset Buffer")
--                map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
--                map("n", "<leader>gb", function()
--                    gs.blame_line({ full = true })
--                end, "Blame Line")
--                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
--            end,
--        }
--        return C
--    end,
--    keys = {
--        -- git hunk navigation - previous / next
--        { "gh", ":Gitsigns next_hunk<CR>", desc = "Goto next git hunk" },
--        { "gH", ":Gitsigns prev_hunk<CR>", desc = "Goto previous git hunk" },
--        { "]g", ":Gitsigns next_hunk<CR>", desc = "Goto next git hunk" },
--        { "[g", ":Gitsigns prev_hunk<CR>", desc = "Goto previous git hunk" },
--    },
--}

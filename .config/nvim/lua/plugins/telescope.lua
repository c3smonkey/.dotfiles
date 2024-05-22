require("config.c3s.globals")

local icons = require("config.c3s.icons")
local plugin = "telescope.nvim"

--
-- INFO: keymaps
--
if Is_Enabled(plugin) and not Use_Default_Keys(plugin) then
    local cmdT = "<cmd>Telescope "
    --local cmdL = "<cmd>lua require('telescope')."

    Keymap("n", "<leader><leader>", cmdT .. "buffers<cr>", { desc = "[ ] Find existing buffers" })
    Keymap("n", "<leader>sk", cmdT .. "keymaps<cr>", { desc = "[s]earch [k]eymaps" })
    Keymap("n", "<leader>sf", cmdT .. "find_files<cr>", { desc = "[s]earch [f]iles" })
	Keymap("n", "<leader>ss", cmdT .. "builtin<cr>", { desc = "[s]earch [s]elect Telescope" })
    Keymap("n", "<leader>sg", cmdT .. "live_grep<cr>", { desc = "[s]earch by [g]rep" })
    Keymap("n", "<leader>sd", cmdT .. "diagnostics<cr>", { desc = "[s]earch [d]iagnostics" })
    Keymap("n", "<leader>sr", cmdT .. "resume<cr>", { desc = "[s]earch [r]esume" })
    Keymap("n", "<leader>sc", cmdT .. "commands<cr>", { desc = "[s]earch [c]ommands" })
    Keymap("n", "<leader>sR", cmdT .. "registers<cr>", { desc = "[s]earch [R]egisters" })
    Keymap("n", "<leader>sC", cmdT .. "colorscheme<cr>", { desc = "[s]witch [C]olorscheme" })
    Keymap("n", "<leader>sH", cmdT .. "help_tags<cr>", { desc = "[s]earch [H]elp" })
    Keymap("n", "<leader>sd", cmdT .. "diagnostics<cr>", { desc = "[s]earch [d]iagnostics" })
    Keymap("n", "<leader>sk", cmdT .. "keymaps<cr>", { desc = "[s]earch [k]eymaps" })
    Keymap("n", "<leader>sw", cmdT .. "grep_string<cr>", { desc = "[s]earch by [w]ord" })

    -- Git
    Keymap("n", "<leader>gC", cmdT .. "git_commits<cr>", { desc = "[g]it [C]ommits" })
    Keymap("n", "<leader>gb", cmdT .. "git_branches<cr>", { desc = "[g]it [b]ranch" })
    Keymap("n", "<leader>gs", cmdT .. "git_status<cr>", { desc = "[g]it [s]tatus" })

    -- LSP
    Keymap("n", "<leader>LS", cmdT .. "lsp_dynamic_workspace_symbols<cr>", { desc = "[L]SP dynamic [S]ymbols" })
    Keymap("n", "<leader>Ls", cmdT .. "lsp_document_symbols<cr>", { desc = "[L]SP document [s]ymbols" })

    -- Harpoon
    Keymap("n", "<leader>sm", cmdT .. "harpoon marks<cr>", { desc = "[s]earch Harpoon [m]arks" })
    -- Marks
    Keymap("n", "<leader>sM", cmdT .. "marks<cr>", { desc = "[s]earch [M]arks" })
end

--
-- INFO: configure telescope
--
return {
    "nvim-telescope/" .. plugin,
    enabled = Is_Enabled(plugin),
    lazy = false,
    cmd = "Telescope",
    requires = {
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "folke/noice.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    keys = function()
        if not Use_Default_Keys(plugin) then
            return { keys = false }
        end
    end,

    opts = function(_, opts)
        if Use_Default_Opts(plugin) then
            opts = opts
        else
            local actions = require("telescope.actions")
            opts.defaults = {
                layout_config = { prompt_position = "top" },
                layout_strategy = "horizontal",
                mappings = {
                    i = {
                        ["<c-j>"] = actions.move_selection_next,
                        ["<c-k>"] = actions.move_selection_previous,
                    },
                },
                --prompt_prefix = icons.ui.Telescope .. " ",
                --selection_caret = icons.ui.TriangleShortArrowRight .. " ",
                sorting_strategy = "ascending",
                winblend = 0,
            }
            opts.pickers = {
				find_files= {
					hidden = true,
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
                colorscheme = {
                    enable_preview = true
                },
            }
        end
    end,

    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("noice")

        -- Enable Telescope extensions if they are installed
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        -- Shortcut for searching your Neovim configuration files
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>sn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[s]earch [n]eovim files" })

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        vim.keymap.set("n", "<leader>s/", function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end, { desc = "[s]earch [/] in Open Files" })

        -- Slightly advanced example of overriding default behavior and theme
        vim.keymap.set("n", "<leader>/", function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[/] Fuzzily search in current buffer" })



    end,
}

require("config.c3s.globals")

local plugin = "go.nvim"

return {
    "ray-x/" .. plugin,
    enabled = Is_Enabled(plugin),
    dependencies = {  -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()',
    config = function()
        require("go").setup({
            trouble = true
        })

        local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                require('go.format').goimports()
            end,
            group = format_sync_grp,
        })

        Keymap("n", ",i", "<cmd>GoImports<cr>",{ desc = "GO [i]mports" })
        Keymap("n", ",cie", "<cmd>GoIfErr<cr>",{ desc = "GO [c]ode [i]f [e]rror" })
        --Keymap("n", ",t", "<cmd>GoTest<cr>",{ desc = "GO [t]est" })
        --Keymap("n", ",tS", "<cmd>GoTestSum<cr>",{ desc = "GO [t]est [S]um" })

    end,

}

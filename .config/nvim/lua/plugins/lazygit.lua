require("config.c3s.globals")

local plugin = "lazygit.nvim"

return {
    "kdheepak/" .. plugin,
    event = 'VeryLazy',
    --event = {"BufEnter"},
    -- ft = "gitcommitd",
    enabled = Is_Enabled(plugin),
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    opts = function(_, opts)
        if Use_Default_Opts(plugin) then
            opts = opts
        else
            opts = {}
        end
        if not Use_Default_Keys(plugin) then
            Keymap("n", "<leader>gg", "<cmd>LazyGit<cr>", { silent = true, desc = "Lazy[g]it [g]it" })
        end
    end,

    config = function()
        require("telescope").load_extension("lazygit")
    end,
}

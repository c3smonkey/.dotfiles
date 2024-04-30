require("config.c3s.globals")

local plugin = "diffview.nvim"

return {
    "sindrets/" .. plugin,
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(plugin),
    --ft = "gitcommit",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = function(_, opts)
        if Use_Default_Opts(plugin) then
            opts = opts
        else
            opts = {}
        end
        if not Use_Default_Keys(plugin) then
            Keymap("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { silent = true, desc = "[g]it [d]iffview" })
        end
    end,

    config = function(_, opts)
        require('diffview').setup(opts)
    end,
}

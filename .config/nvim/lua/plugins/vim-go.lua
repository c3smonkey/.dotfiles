require("config.c3s.globals")

local plugin = "go.nvim"

return {
    "ray-x/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = "VeryLazy",
    dependencies = {  -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()'
}

require("config.c3s.globals")

local plugin = "limelight.vim"

return {
    "junegunn/" .. plugin,
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(plugin),
    keys = {
        { "<leader>wl", "<CMD>Limelight!!<CR>", desc = "[w]riting - toggle [l]imelight" },
    },
    config = function()
        -- used for Limelight
        vim.g.limelight_conceal_ctermfg = "gray"
        vim.g.limelight_conceal_guifg = 'DarkGray'
    end
}

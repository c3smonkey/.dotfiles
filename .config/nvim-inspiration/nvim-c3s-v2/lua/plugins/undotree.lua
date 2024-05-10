require("config.c3s.globals")

local plugin = "undotree"

return {
    "mbbill/" .. plugin,
    event = 'VeryLazy',
    enabled = Is_Enabled(plugin),
    config = function()
        vim.keymap.set('n', '<leader>uh', "<CMD>UndotreeToggle<CR>", { desc = 'Toggle [u]ndo [h]istory' })
    end,
}

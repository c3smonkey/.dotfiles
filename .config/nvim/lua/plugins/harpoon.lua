require("config.c3s.globals")

local plugin = "harpoon"

return {
    "ThePrimeagen/" .. plugin,
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(plugin),
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = function(_, opts)
        if Use_Default_Opts(plugin) then
            opts = opts
        else
            opts = {}
        end
        if not Use_Default_Keys(plugin) then
            Keymap('n', '<leader>hm', "<CMD>lua require('harpoon.mark').add_file()<CR>", { desc = '[h]arpoon [m]ark' })
            Keymap('n', '<leader>hn', "<CMD>lua require('harpoon.ui').nav_next()<CR>", { desc = '[h]arpoon [n]ext Mark' })
            Keymap('n', '<leader>hp', "<CMD>lua require('harpoon.ui').nav_prev()<CR>", { desc = '[h]arpoon [p]revious Mark' })
            Keymap('n', '<leader>ht', "<CMD>lua require('harpoon.term').gotoTerminal(1)<CR>", { desc = '[h]arpoON [t]erminal' })
        end
    end,

    config = function(_, opts)
        require('harpoon').setup(opts)
    end,
}

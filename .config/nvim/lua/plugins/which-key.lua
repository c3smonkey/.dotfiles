require("config.c3s.globals")

local plugin = "which-key.nvim"

return {
    "folke/" .. plugin,
    event = "VeryLazy",
    enabled = Is_Enabled(plugin),
    config = function(_, config)
        if Use_Default_Config(plugin) then
            config = config
        else
            -- This is the function that runs, AFTER loading
            require('which-key').setup()
            -- Document existing key chains
            require('which-key').register {
                ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
                ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
                ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
                ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
                ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
            }
        end
    end,
}

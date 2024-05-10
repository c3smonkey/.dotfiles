In_Tmux = require("config.c3s.functions.plugins").in_tmux

local Goyo = {}

local tmux_enabled = false
local goyo_activated = false

Goyo = {

    goyoEnter = function()
        if In_Tmux then
            if not tmux_enabled then
                -- Disable Tmux settings
                vim.fn.system('tmux set status off') -- Disable status bar
                vim.fn.system('tmux resize-pane -Z') -- Resize pane if not zoomed
                tmux_enabled = true
            else
                -- Enable Tmux settings
                vim.fn.system('tmux set status on')  -- Enable status bar
                tmux_enabled = false
            end
        end

        -- Toggle activation status for Limelight and Goyo
        if not goyo_activated then
            vim.cmd('Limelight')
            vim.cmd('Goyo')
            -- Set other Neovim settings
            vim.cmd('set noshowmode')
            vim.cmd('set noshowcmd')
            vim.cmd('set scrolloff=999')
            -- Disable Lualine
            require('lualine').hide()
            goyo_activated = true
        else
            vim.cmd('Limelight!')
            vim.cmd('Goyo!')
            require('lualine').hide({unhide=true})
            goyo_activated = false
        end

    end
}

return Goyo


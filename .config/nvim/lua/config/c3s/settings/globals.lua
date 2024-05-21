-- ----------------------------------------------------------------------------------------------------
-- NOTE: Global settings
-- ----------------------------------------------------------------------------------------------------

local globals = {
    have_nerd_font = true,                                  -- Set to true if you have a Nerd Font installed
    loaded_matchit = 0,                                     -- Disable matchit
    loaded_netrwPlugin = 1,                                 -- Disable netrw
    netrw_browse_split = 0,                                 -- open netrw in the current window
    netrw_banner = 0,                                       -- Disable netrw banner
    netrw_altv = 0,                                         -- Open netrw in a vertical split
    netrw_liststyle = 3,                                    -- Set netrw list style to tree
    netrw_winsize = 15,                                     -- Set size of the window
}

for key, value in pairs(globals) do
    vim.g[key] = value
end

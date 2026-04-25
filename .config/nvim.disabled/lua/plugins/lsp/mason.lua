require("config.c3s.globals")

local plugin = "mason.nvim"

return {
    "williamboman/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = "BufRead",
    config = function()
        local mason = require("mason")
        mason.setup({
            auto_install = true,
            ui = {
                border = "double",
                icons = {
                    package_installed = " ",
                    package_pending = "󰌚 ",
                    package_uninstalled = "󰢤 ",
                },
            },
        })
    end,
}

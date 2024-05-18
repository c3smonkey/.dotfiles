require("config.c3s.globals")

local plugin = "mason.nvim"

return {
    {
        "williamboman/" .. plugin,
        enabled = Is_Enabled(plugin),
        event = "VeryLazy",
        opts = {
            ui = {
                border = "double",
                icons = {
                    package_installed = " ",
                    package_pending = "󰌚 ",
                    package_uninstalled = "󰢤 ",
                },
            },
        },
    }
}

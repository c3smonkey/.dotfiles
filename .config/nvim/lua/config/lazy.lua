--- Setup lazy.nvim

require("lazy").setup({
    spec = {
        { import = "plugins"},
        { import = "plugins.lsp"},
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = true,
    },
    defaults = {
        lazy = true,
        version = false,
    },
    ui = {
        size = { width = 0.80, height = 0.80 },
        border = "rounded",
        title = "lazy.nvim",
    },
    performance = {
        cache = { enabled = true, },
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})


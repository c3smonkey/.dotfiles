return {
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/git/", "~/dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
        })

        vim.keymap.set("n", ";ws", "<cmd>SessionSave<CR>", { desc = "[S]ave [W]orkspace For Current Directory" }) -- save workspace session for current working directory
        vim.keymap.set("n", ";wr", "<cmd>SessionRestore<CR>", { desc = "[R]estore [W]orkspace For Current Directory" }) -- restore last workspace session for current directory
    end,
}

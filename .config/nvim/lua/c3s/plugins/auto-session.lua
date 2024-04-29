return {
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/git/", "~/dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
        })
		session_lens = {
			-- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
			buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
			load_on_setup = true,
			theme_conf = { border = true },
			previewer = false,
		},

		vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
			noremap = true, desc = "search [l]oaded [s]essions",
		})
    end,
}




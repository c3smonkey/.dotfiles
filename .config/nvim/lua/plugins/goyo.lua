require("config.c3s.globals")

local plugin = "goyo.vim"

return {
	"junegunn/" .. plugin,
	event = { "BufReadPost", "BufNewFile" },
	enabled = Is_Enabled(plugin),
	keys = {
		{ "<leader>wg", "<CMD>Goyo<CR>", desc = "[w]riting - toggle [g]oyo" },
	},
}





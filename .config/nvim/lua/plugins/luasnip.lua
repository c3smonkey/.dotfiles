local plugin = "LuaSnip"

return {
	"L3MON4D3/" .. plugin,
	enabled = Is_Enabled(plugin),
	event = "InsertEnter",
	version = "v2.*",
	build = "make install_jsregexp",
	dependencies = { "saadparwaiz1/cmp_luasnip" },
	keys = {
		{
			"<c-l>",
			function() require("luasnip").jump(1) end,
			desc = "Jump forward a snippet placement",
			mode = "i",
			noremap = true,
			silent = true
		}, {
			"<c-h>",
			function() require("luasnip").jump(-1) end,
			desc = "Jump backward a snippet placement",
			mode = "i",
			noremap = true,
			silent = true
		}
	},
	config = function()
		require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets"})
	end
}


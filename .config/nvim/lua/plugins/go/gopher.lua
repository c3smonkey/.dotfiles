require("config.c3s.globals")

local plugin = "gopher.nvim"

return {
	"olexsmir/" .. plugin,
	enabled = Is_Enabled(plugin),
	requires = { -- dependencies
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = {"go"},
	config = function(_, opts)
		require("gopher").setup(opts)
	end,
	build = function ()
		vim.cmd [[silent! GoInstallDeps]]
	end,
	keys = {
		{
			"<localleader>gsj",
			"<cmd> GoTagAdd json<cr>",
			desc = "[g]o [s]truct [j]son tag",
		},
		{
			"<localleader>gsy",
			"<cmd> GoTagAdd yaml<cr>",
			desc = "[g]o [s]truct [y]aml tag",
		},
		{
			"<localleader>gie",
			"<cmd> GoIfErr<cr>",
			desc = "[g]o [i]f [e]rror",
		},
		{
			"<localleader>gta",
			"<cmd> GoTestAdd<cr>",
			desc = "[g]o [t]est [a]dd",
		},
		{
			"<localleader>gtA",
			"<cmd> GoTestAll<cr>",
			desc = "[g]o [t]est [A]ll",
		},
		{
			"<localleader>gmt",
			"<cmd> GoMod tidy<cr>",
			desc = "[g]o [m]od [t]idy",
		},
	}
}

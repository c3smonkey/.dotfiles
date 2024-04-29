return {
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

	{ -- LSP Support
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
		keys = {
			{"<leader>i", "<cmd>LspInfo<cr>", "Lsp Info"},
			{"<leader>I", "<cmd>LspInstall<cr>", "Lsp Install"},
		},

		config = function()

			-- Use lsp_zero to manage lsp attachments.
			local lsp_zero = require('lsp-zero')
			lsp_zero.on_attach(function(_, bufnr)
				lsp_zero.default_keymaps({buffer = bufnr})
			end)

		end,

	},

	{ -- LSP Config
		'neovim/nvim-lspconfig',
		dependencies = {
			{'hrsh7th/cmp-nvim-lsp'},
		}
	},

	{ -- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			{'L3MON4D3/LuaSnip'}
		},
	},
}

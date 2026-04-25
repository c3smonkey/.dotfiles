vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.env.MASON = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")

if not vim.env.KOTLIN_LSP_DIR then
	local kotlin_pkg = vim.fn.stdpath("data") .. "/mason/packages/kotlin-lsp"
	local matches = vim.fn.glob(kotlin_pkg .. "/kotlin-server-*", false, true)
	if type(matches) == "table" and #matches > 0 then
		vim.env.KOTLIN_LSP_DIR = matches[1]
	end
end

-- pack
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/AlexandrosAlexiou/kotlin.nvim" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/ellisonleao/glow.nvim" },
})

require("colorscheme")
require("plugins.whichkey")
require("keymaps")

-- mini
require("mini.basics").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.tabline").setup()
require("mini.pick").setup()

vim.o.laststatus = 3
vim.o.statusline = "%<%t %h%w%m%r%=%-14.(%l,%c%V%) %P"
vim.o.cmdheight = 0
vim.o.undofile = true

-- yazi
require("yazi").setup({
	open_for_directories = false,
	yazi_floating_window_border = "rounded",
})

-- copilot
require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		keymap = {
			-- macOS: <M-...> means Option/Alt (⌥)
			accept = "<M-l>", -- ⌥ + l
			next = "<M-]>", -- ⌥ + ]
			prev = "<M-[>", -- ⌥ + [
			dismiss = "<C-]>", -- Control + ]
		},
	},
	panel = {
		enabled = false,
	},
})

local ok_copilotchat, copilotchat = pcall(require, "CopilotChat")
if ok_copilotchat then
	copilotchat.setup({
		window = {
			layout = "float",
			relative = "editor",
			border = "rounded",
			width = 0.9,
			height = 0.85,
		},
		auto_insert_mode = true,
		mappings = {
			submit_prompt = {
				normal = "<CR>",
				insert = "<CR>",
			},
		},
	})
end

local ok_glow, glow = pcall(require, "glow")
if ok_glow then
	glow.setup({
		style = "dark",
	})
end

-- mason
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"pyright",
		"typescript-language-server",
		"kotlin-lsp",
	},
})

-- kotlin
-- kotlin.nvim currently expects an older kotlin-lsp layout from Mason.
-- Use Mason's intellij-server binary directly for stable Kotlin LSP startup.
local kotlin_lsp_cmd = vim.fn.stdpath("data") .. "/mason/bin/intellij-server"
if vim.fn.executable(kotlin_lsp_cmd) == 1 then
	local kotlin_system_path = vim.fn.stdpath("cache") .. "/kotlin-lsp-workspace-" .. tostring(vim.fn.getpid())
	vim.fn.mkdir(kotlin_system_path, "p")

	vim.lsp.config("kotlin_lsp", {
		cmd = { kotlin_lsp_cmd, "--stdio", "--system-path", kotlin_system_path },
		filetypes = { "kotlin" },
		root_markers = { "settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", "pom.xml", "mvnw", ".git" },
	})
	vim.lsp.enable("kotlin_lsp")
end

-- lsp
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			},
		},
	},
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")

-- Compatibility command when nvim-lspconfig user commands are unavailable
if vim.fn.exists(":LspInfo") == 0 then
	vim.api.nvim_create_user_command("LspInfo", function()
		local clients = vim.lsp.get_clients({ bufnr = 0 })
		if #clients == 0 then
			vim.notify("No LSP clients attached to current buffer", vim.log.levels.WARN)
			return
		end

		local names = {}
		for _, client in ipairs(clients) do
			table.insert(names, string.format("%s (id:%d)", client.name, client.id))
		end

		vim.notify("Attached LSP: " .. table.concat(names, ", "), vim.log.levels.INFO)
	end, { desc = "Show attached LSP clients" })
end

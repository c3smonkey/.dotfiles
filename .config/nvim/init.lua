vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.env.MASON = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")

-- Netrw: hide banner
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0

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

-- mini.files (central overlay file explorer)
require("mini.files").setup({
	-- Customize window appearance
	windows = {
		preview = false,  -- Preview OFF by default for performance (toggle with 'p')
		width_preview = 50,  -- Preview window width (when enabled)
		width_focus = 40,  -- Main window width (wider without preview)
		width_nofocus = 25,  -- Unfocused window width
		max_number = 3,  -- Maximum number of windows to show
	},
	-- Customize mappings inside mini.files
	mappings = {
		close = "q",           -- Close with q
		go_in = "<CR>",        -- Enter directory/open file with Enter
		go_in_plus = "<C-CR>", -- Open in split
		go_out = "-",          -- Go to parent directory with -
		go_out_plus = "H",     -- Go to parent and stay on same entry
		reset = "<BS>",        -- Reset to initial directory
		reveal_cwd = "@",      -- Reveal current working directory
		show_help = "g?",      -- Show help
		synchronize = "=",     -- Synchronize filesystem changes
		trim_left = "<",       -- Trim left column
		trim_right = ">",      -- Trim right column
	},
	-- Options for file/directory operations
	options = {
		permanent_delete = false,  -- Use trash instead of permanent delete
		use_as_default_explorer = true,  -- Use as default file explorer
	},
	-- Customize content display
	content = {
		filter = nil,  -- Predicate to filter entries (nil = show all)
		prefix = nil,  -- Function to add prefix to entry
		sort = nil,    -- Function to sort entries (nil = alphabetical)
	},
})

-- Custom: Toggle preview in mini.files with 'p' key
-- This creates a proper toggle that persists across navigation
local preview_enabled = false

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		
		-- Add 'p' keymap to toggle preview
		vim.keymap.set("n", "p", function()
			preview_enabled = not preview_enabled
			
			-- Close and reopen with new settings
			local MiniFiles = require("mini.files")
			local current_entry = MiniFiles.get_fs_entry()
			
			MiniFiles.close()
			
			-- Update config
			MiniFiles.config.windows.preview = preview_enabled
			
			-- Reopen at same location
			if current_entry then
				MiniFiles.open(current_entry.path)
			else
				MiniFiles.open()
			end
			
			-- Notify user
			local status = preview_enabled and "ON ✓" or "OFF"
			vim.notify("Preview: " .. status, vim.log.levels.INFO)
		end, { buffer = buf_id, desc = "Toggle preview (p)" })
	end,
})

vim.o.laststatus = 3
vim.o.statusline = "%<%t %h%w%m%r%=%-14.(%l,%c%V%) %P"
vim.o.cmdheight = 0
vim.o.undofile = true

-- Use system clipboard (register +) so copy/paste works with macOS
vim.opt.clipboard = "unnamedplus"

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

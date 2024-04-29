-- Inspired by https://lsp-zero.netlify.app/v3.x/blog/you-might-not-need-lsp-zero.html
local keymap = vim.keymap

-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "open diagnostics in floating windowd" })
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "go to previous diagnostic" })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "go to next diagnostic" })

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local buf = event.buf

    -- Debounce by 300ms by default
    client.config.flags.debounce_text_changes = 300

    -- This will set up formatting for the attached LSPs
    client.server_capabilities.documentFormattingProvider = true

    -- TODO recheck these keybindings once Neovim 0.10 is out as it
    -- will have some proper defaults (see https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#configuration)
    keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[g]oto [i]mplementation", buffer = buf })
    keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[g]oto [d]efinition", buffer = buf })
    keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[g]oto [D]eclaration", buffer = buf })
    keymap.set("n", "gu", vim.lsp.buf.references, { desc = "[g]oto [r]eferences", buffer = buf })


    keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "[L]SP -> [h]over", buffer = buf })
    keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover", buffer = buf })
    keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "[L]SP -> [s]ignature", buffer = buf })
    keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "[r]ename", buffer = buf })
    keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, { desc = "[L]SP -> set [q]uickfix list", buffer = buf })
    keymap.set("n", "<leader>ld", vim.lsp.buf.type_definition, { desc = "[L]SP -> type [d]efinition", buffer = buf })
    keymap.set("n", "<leader>lc", vim.lsp.buf.incoming_calls, { desc = "[L]SP -> show incoming [c]alls", buffer = buf })

  end
})

-- disable virtual text for diagnosts as we use the trouble.nvim plugin
vim.diagnostic.config({
  virtual_text = false,
})

local mason = require("mason")
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")

local mason_tool_installer = require("mason-tool-installer")
mason_tool_installer.setup({
  ensure_installed = {
    "prettier", -- prettier formatter
    "stylua", -- lua formatter
    "ktlint",
    "detekt",
    "xmlformatter",
  },
})

local normal_capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_capabilities = cmp_nvim_lsp.default_capabilities(normal_capabilities)

local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    'rust_analyzer',
    'gopls',
    'tsserver',
    'pylsp',
    'kotlin_language_server',
    'astro',
    'lemminx',
    'taplo',
    'emmet_language_server',
    'lua_ls',
    "yamlls",
  },
  handlers = { -- automatically setup LSPs installed via Mason
    default_setup, -- default configuration for most server, unless overriden below
    lua_ls = function() -- configuration for Lua
      lspconfig.lua_ls.setup({
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT'
            },
            diagnostics = {
              globals = {'vim'},
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              }
            }
          }
        }
      })
    end,
  },
})

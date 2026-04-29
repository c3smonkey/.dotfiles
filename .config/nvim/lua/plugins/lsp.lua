-- ╭─────────────────────────────────────────────────────────╮
-- │  LSP Configuration (Native Neovim 0.11+ API)           │
-- │  Konsistent mit IdeaVim Keybindings                     │
-- ╰─────────────────────────────────────────────────────────╯

-- Mason: LSP/DAP/Linter installer
local ok_mason, mason = pcall(require, "mason")
if not ok_mason then
  vim.notify("mason.nvim ist nicht geladen", vim.log.levels.WARN)
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
    border = "rounded",
  }
})

-- ═══════════════════════════════════════════════════════════
-- LSP Configuration (Native Neovim 0.11+ API)
-- ═══════════════════════════════════════════════════════════

-- Get cmp_nvim_lsp capabilities (if nvim-cmp is loaded)
local capabilities = vim.lsp.protocol.make_client_capabilities()
if _G.cmp_nvim_lsp_capabilities then
  capabilities = vim.tbl_deep_extend("force", capabilities, _G.cmp_nvim_lsp_capabilities)
end

-- Lua Language Server Configuration
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',  -- Neovim uses LuaJIT
      },
      diagnostics = {
        -- Erkennt Neovim globals wie `vim`
        globals = { 'vim' },
      },
      workspace = {
        -- Macht Neovim runtime files bekannt
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,  -- Disable annoying prompt
      },
      telemetry = {
        enable = false,
      },
      -- Completion
      completion = {
        callSnippet = "Replace"
      },
      -- Format
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        }
      },
    },
  },
})

-- ═══════════════════════════════════════════════════════════
-- LSP Keymaps (konsistent mit IdeaVim) - via LspAttach
-- ═══════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf
    local opts = { buffer = bufnr, noremap = true, silent = true }
    
    -- ────────────────────────────────────────────────────────
    -- NOTE: Auto-Completion is handled by nvim-cmp (see completion.lua)
    -- Native vim.lsp.completion is disabled in favor of nvim-cmp
    -- ────────────────────────────────────────────────────────
    
    -- ────────────────────────────────────────────────────────
    -- Navigation (g-Prefix - IDENTISCH zu IdeaVim)
    -- ────────────────────────────────────────────────────────
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, 
      vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
      vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
    
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
      vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
    
    -- gr: In IdeaVim "GotoRelated", in LSP "references"
    vim.keymap.set("n", "gr", vim.lsp.buf.references,
      vim.tbl_extend("force", opts, { desc = "Show references" }))
    
    -- gU: IdeaVim "FindUsages" - alias für references
    vim.keymap.set("n", "gU", vim.lsp.buf.references,
      vim.tbl_extend("force", opts, { desc = "Find usages (references)" }))
    
    -- K: Hover Documentation (IDENTISCH zu IdeaVim)
    vim.keymap.set("n", "K", vim.lsp.buf.hover,
      vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
    
    -- Signature help (nützlich beim Function calls)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help,
      vim.tbl_extend("force", opts, { desc = "Signature help" }))
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help,
      vim.tbl_extend("force", opts, { desc = "Signature help" }))
    
    -- ────────────────────────────────────────────────────────
    -- NOTE: Completion Keybindings are handled by nvim-cmp
    -- See completion.lua for: <Tab>, <S-Tab>, <C-Space>, <CR>, etc.
    -- ────────────────────────────────────────────────────────
    
    -- ────────────────────────────────────────────────────────
    -- Code Actions (<leader> Prefix - KONSISTENT zu IdeaVim)
    -- ────────────────────────────────────────────────────────
    
    -- <leader>ca: Code Action (IDENTISCH zu IdeaVim)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
      vim.tbl_extend("force", opts, { desc = "[C]ode [A]ction" }))
    vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action,
      vim.tbl_extend("force", opts, { desc = "[C]ode [A]ction" }))
    
    -- <leader>rn: Rename (IDENTISCH zu IdeaVim)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
      vim.tbl_extend("force", opts, { desc = "[R]e[n]ame symbol" }))
    
    -- ────────────────────────────────────────────────────────
    -- Format (Komma-Prefix - KONSISTENT zu IdeaVim)
    -- ────────────────────────────────────────────────────────
    
    -- ,f: Format (IDENTISCH zu IdeaVim)
    if client.server_capabilities.documentFormattingProvider then
      vim.keymap.set("n", ",f", function()
        vim.lsp.buf.format({ async = true })
      end, vim.tbl_extend("force", opts, { desc = "Format document" }))
    end
    
    -- ────────────────────────────────────────────────────────
    -- Diagnostics
    -- ────────────────────────────────────────────────────────
    
    -- ]d / [d: Next/Previous diagnostic (Neovim 0.10+ builtin)
    -- Diese sind bereits von Neovim gesetzt!
    
    -- ,se: Show Error description (KONSISTENT zu IdeaVim)
    vim.keymap.set("n", ",se", vim.diagnostic.open_float,
      vim.tbl_extend("force", opts, { desc = "[S]how [E]rror description" }))
    
    -- Optional: Diagnostics to loclist
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist,
      vim.tbl_extend("force", opts, { desc = "[D]iagnostics to [L]oclist" }))
    
    -- LSP Info
    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>",
      vim.tbl_extend("force", opts, { desc = "[L]SP [I]nfo" }))
    
    -- Silent notification (only visible in :LspInfo or :messages)
    -- Removed vim.notify to avoid "Press ENTER" prompt
  end,
})

-- ═══════════════════════════════════════════════════════════
-- Enable LSP Auto-Activation
-- ═══════════════════════════════════════════════════════════
vim.lsp.enable('lua_ls')

-- ═══════════════════════════════════════════════════════════
-- Diagnostics Configuration
-- ═══════════════════════════════════════════════════════════
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',  -- Could be '■', '▎', '●', etc.
    source = "if_many",  -- Show source if multiple sources
  },
  signs = true,             -- Zeigt signs in gutter
  underline = true,         -- Underline errors
  update_in_insert = false, -- Nur in Normal mode updaten
  severity_sort = true,     -- Sortiert nach severity
  float = {
    border = "rounded",
    source = "always",      -- Always show diagnostic source
    header = "",
    prefix = "",
  },
})

-- Diagnostic signs in gutter
local signs = {
  { name = "DiagnosticSignError", text = "✘" },
  { name = "DiagnosticSignWarn",  text = "▲" },
  { name = "DiagnosticSignHint",  text = "⚑" },
  { name = "DiagnosticSignInfo",  text = "»" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, {
    texthl = sign.name,
    text = sign.text,
    numhl = ""
  })
end

-- Floating window borders
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

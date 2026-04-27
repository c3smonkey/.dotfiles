local function executable(cmd)
  return vim.fn.executable(cmd) == 1
end

local ok_mason, mason = pcall(require, 'mason')
if ok_mason then
  mason.setup()
end

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      telemetry = {
        enable = false,
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
    },
  },
})

local augroup = vim.api.nvim_create_augroup('UserLspConfig', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map('n', 'gd', vim.lsp.buf.definition, 'LSP: Go to definition')
    map('n', 'gr', vim.lsp.buf.references, 'LSP: References')
    map('n', 'K', vim.lsp.buf.hover, 'LSP: Hover')
    map('n', '<leader>rn', vim.lsp.buf.rename, 'LSP: Rename')
    map('n', '<leader>ca', vim.lsp.buf.code_action, 'LSP: Code action')
    map('n', '[d', vim.diagnostic.goto_prev, 'Diagnostic: Prev')
    map('n', ']d', vim.diagnostic.goto_next, 'Diagnostic: Next')
    map('i', '<C-Space>', function()
      vim.lsp.completion.get()
    end, 'LSP: Trigger completion')

    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end
  end,
})

if executable('lua-language-server') then
  vim.lsp.enable('lua_ls')
else
  vim.schedule(function()
    vim.notify(
      'lua-language-server not found. Run :MasonInstall lua-language-server then restart Neovim.',
      vim.log.levels.WARN
    )
  end)
end

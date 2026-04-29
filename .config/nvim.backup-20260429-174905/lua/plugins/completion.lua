-- ╭─────────────────────────────────────────────────────────╮
-- │  nvim-cmp: Auto-Completion Configuration               │
-- ╰─────────────────────────────────────────────────────────╯

local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then
  vim.notify("nvim-cmp ist nicht geladen", vim.log.levels.WARN)
  return
end

local ok_luasnip, luasnip = pcall(require, "luasnip")
if not ok_luasnip then
  vim.notify("LuaSnip ist nicht geladen", vim.log.levels.WARN)
  return
end

-- ═══════════════════════════════════════════════════════════
-- nvim-cmp Setup
-- ═══════════════════════════════════════════════════════════

cmp.setup({
  -- Snippet Engine
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  
  -- Completion Window
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  
  -- Keybindings
  mapping = cmp.mapping.preset.insert({
    -- Navigate completion items
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    
    -- Scroll documentation
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    
    -- Trigger completion manually
    ['<C-Space>'] = cmp.mapping.complete(),
    
    -- Close completion
    ['<C-e>'] = cmp.mapping.abort(),
    
    -- Accept completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Only confirm explicitly selected items
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),  -- Accept currently selected item
  }),
  
  -- Completion Sources (in order of priority)
  sources = cmp.config.sources({
    { 
      name = 'nvim_lsp',
      priority = 1000,
      max_item_count = 50,
      keyword_length = 1,
      -- Filter out private/internal functions (starting with _)
      entry_filter = function(entry, ctx)
        local kind = require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]
        local word = entry:get_word()
        
        -- Filter out items starting with underscore (private/internal)
        if vim.startswith(word, '_') then
          return false
        end
        
        -- Always show modules, classes, interfaces
        if kind == 'Module' or kind == 'Class' or kind == 'Interface' then
          return true
        end
        
        return true
      end
    },
    { name = 'luasnip',  priority = 750 },   -- Snippets
    { name = 'buffer',   priority = 500, keyword_length = 3 },   -- Buffer words (min 3 chars)
    { name = 'path',     priority = 250 },   -- File paths
  }),
  
  -- Formatting
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = function(entry, vim_item)
      -- Kind icons
      local kind_icons = {
        Text = "",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂊",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
      }
      
      -- Set kind icon
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind] or "", vim_item.kind)
      
      -- Set menu source
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        buffer = "[Buf]",
        path = "[Path]",
      })[entry.source.name]
      
      return vim_item
    end,
  },
  
  -- Experimental features
  experimental = {
    ghost_text = false,  -- Show preview as ghost text (can be distracting)
  },
})

-- ═══════════════════════════════════════════════════════════
-- LSP Capabilities Integration
-- ═══════════════════════════════════════════════════════════

-- Add cmp_nvim_lsp capabilities to LSP
-- This must be done BEFORE lspconfig setup (handled in lsp.lua)
local ok_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp_lsp then
  -- Store capabilities in a global for lsp.lua to use
  _G.cmp_nvim_lsp_capabilities = cmp_nvim_lsp.default_capabilities()
end

-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox Konfiguration                                  │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

-- ╭───────────────────╮
-- │  Default Options  │
-- ╰───────────────────╯

M.options = {
  -- Basis
  background = "dark",              -- "dark" | "light"
  contrast = "hard",                -- "soft" | "medium" | "hard"
  
  -- Styles
  bold = true,
  italic = true,
  underline = true,
  undercurl = true,
  inverse = true,
  
  -- Features
  improved_strings = false,         -- Strings mit Background
  improved_warnings = false,        -- Bessere Spell-Warnings
  invert_selection = true,          -- Visual Mode invert
  invert_signs = false,             -- Sign Column invert
  invert_tabline = false,           -- Tabline invert
  
  -- Terminal
  terminal_colors = true,           -- Set terminal colors
  
  -- Plugins (optional - für zukünftige Erweiterung)
  plugins = {
    treesitter = true,
    lsp = true,
    -- gitsigns = true,
    -- telescope = true,
    -- nvim_tree = true,
  },
}

-- ╭─────────────────╮
-- │  Merge Options  │
-- ╰─────────────────╯

function M.merge(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M

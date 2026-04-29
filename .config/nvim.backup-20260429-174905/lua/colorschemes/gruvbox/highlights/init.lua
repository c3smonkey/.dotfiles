-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox Highlights Loader                              │
-- │  Lädt und wendet alle Highlight-Gruppen an              │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

function M.apply(colors, config)
  -- Module laden
  local editor = require("colorschemes.gruvbox.highlights.editor")
  local syntax = require("colorschemes.gruvbox.highlights.syntax")
  local treesitter = require("colorschemes.gruvbox.highlights.treesitter")
  local lsp = require("colorschemes.gruvbox.highlights.lsp")
  
  -- Highlights anwenden (Reihenfolge ist wichtig!)
  editor.apply(colors, config)
  syntax.apply(colors, config)
  
  -- Optional: Nur wenn aktiviert
  if config.plugins.treesitter then
    treesitter.apply(colors, config)
  end
  
  if config.plugins.lsp then
    lsp.apply(colors, config)
  end
  
  -- Optional: Plugin & Language Highlights
  -- local plugins = require("colorschemes.gruvbox.highlights.plugins")
  -- local languages = require("colorschemes.gruvbox.highlights.languages")
  -- plugins.apply(colors, config)
  -- languages.apply(colors, config)
end

return M

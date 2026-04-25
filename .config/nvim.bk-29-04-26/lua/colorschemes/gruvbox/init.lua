-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox Colorscheme für Neovim 0.12+                   │
-- │  Vollständige Lua-Implementation                        │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

-- Module laden
local config = require("colorschemes.gruvbox.config")
local palette = require("colorschemes.gruvbox.palette")
local highlights = require("colorschemes.gruvbox.highlights")
local terminal = require("colorschemes.gruvbox.terminal")
local utils = require("colorschemes.gruvbox.utils")

-- ╭────────────╮
-- │  Setup     │
-- ╰────────────╯

function M.setup(opts)
  -- User-Optionen mergen
  if opts then
    config.merge(opts)
  end
  
  -- Neovim Optionen setzen
  vim.opt.termguicolors = true
  vim.opt.background = config.options.background
  
  -- Colors zurücksetzen
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  
  -- Colorscheme Namen setzen
  vim.g.colors_name = "gruvbox"
  
  -- Palette generieren (basierend auf background & contrast)
  local colors = palette.get(config.options.background, config.options.contrast)
  
  -- Highlights anwenden
  highlights.apply(colors, config.options)
  
  -- Terminal Colors setzen
  if config.options.terminal_colors then
    terminal.apply(colors)
  end
end

-- ╭──────────────╮
-- │  Public API  │
-- ╰──────────────╯

-- Farb-Palette exportieren (für User)
function M.colors()
  return palette.get(config.options.background, config.options.contrast)
end

-- Konfiguration exportieren
M.config = config.options

return M

-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox Utility Functions                              │
-- │  Helper functions für Highlight-Generierung             │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

-- ╭──────────────────────╮
-- │  Highlight Helper    │
-- ╰──────────────────────╯

-- Setzt ein Highlight mit Neovim 0.12 API
function M.highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ╭────────────────────────╮
-- │  Highlight Link Helper │
-- ╰────────────────────────╯

-- Linkt ein Highlight zu einem anderen
function M.link(from, to)
  vim.api.nvim_set_hl(0, from, { link = to })
end

-- ╭─────────────────────╮
-- │  Style Builder      │
-- ╰─────────────────────╯

-- Erstellt style table aus config options
function M.build_style(config)
  local style = {}
  
  if config.bold then
    table.insert(style, "bold")
  end
  
  if config.italic then
    table.insert(style, "italic")
  end
  
  if config.underline then
    table.insert(style, "underline")
  end
  
  if config.undercurl then
    table.insert(style, "undercurl")
  end
  
  if config.inverse then
    table.insert(style, "reverse")
  end
  
  return #style > 0 and table.concat(style, ",") or nil
end

-- ╭──────────────────────────╮
-- │  Color with Fallback     │
-- ╰──────────────────────────╯

-- Gibt Farbe oder NONE zurück
function M.color_or_none(color)
  return color ~= "NONE" and color or "NONE"
end

return M

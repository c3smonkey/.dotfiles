-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox Editor Highlights                              │
-- │  UI-Elemente, Gutter, Cursor, Popups, etc.              │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}
local utils = require("colorschemes.gruvbox.utils")

function M.apply(colors, config)
  local hl = utils.highlight
  local link = utils.link
  
  -- ╭───────────────╮
  -- │  Normal Text  │
  -- ╰───────────────╯
  
  hl("Normal", { fg = colors.fg1, bg = colors.bg0 })
  hl("NormalFloat", { fg = colors.fg1, bg = colors.bg1 })
  hl("NormalNC", { fg = colors.fg1, bg = colors.bg0 })
  
  -- ╭──────────────╮
  -- │  Cursor Line │
  -- ╰──────────────╯
  
  hl("CursorLine", { bg = colors.bg1 })
  link("CursorColumn", "CursorLine")
  hl("CursorLineNr", { fg = colors.yellow, bg = colors.bg1, bold = config.bold })
  
  -- ╭───────────╮
  -- │  Line Nr  │
  -- ╰───────────╯
  
  hl("LineNr", { fg = colors.bg4, bg = colors.bg0 })
  hl("SignColumn", { fg = colors.fg4, bg = colors.bg0 })
  
  -- ╭─────────╮
  -- │  Cursor │
  -- ╰─────────╯
  
  hl("Cursor", { reverse = true })
  link("lCursor", "Cursor")
  link("iCursor", "Cursor")
  link("vCursor", "Cursor")
  link("CursorIM", "Cursor")
  link("TermCursor", "Cursor")
  hl("TermCursorNC", { fg = colors.fg1, bg = colors.bg1 })
  
  -- ╭──────────╮
  -- │  Visual  │
  -- ╰──────────╯
  
  if config.invert_selection then
    hl("Visual", { bg = colors.bg3, reverse = true })
  else
    hl("Visual", { bg = colors.bg3 })
  end
  link("VisualNOS", "Visual")
  
  -- ╭──────────╮
  -- │  Search  │
  -- ╰──────────╯
  
  hl("Search", { fg = colors.yellow, bg = colors.bg0, reverse = true })
  hl("IncSearch", { fg = colors.orange, bg = colors.bg0, reverse = true })
  hl("CurSearch", { link = "IncSearch" })
  
  -- ╭───────────────╮
  -- │  Status Line  │
  -- ╰───────────────╯
  
  hl("StatusLine", { fg = colors.bg2, bg = colors.fg1, reverse = true })
  hl("StatusLineNC", { fg = colors.bg1, bg = colors.fg4, reverse = true })
  
  -- ╭──────────╮
  -- │  TabLine │
  -- ╰──────────╯
  
  if config.invert_tabline then
    hl("TabLine", { fg = colors.bg4, bg = colors.bg1, reverse = true })
    hl("TabLineFill", { fg = colors.bg4, bg = colors.bg1, reverse = true })
    hl("TabLineSel", { fg = colors.green, bg = colors.bg1, reverse = true })
  else
    hl("TabLine", { fg = colors.bg4, bg = colors.bg1 })
    hl("TabLineFill", { fg = colors.bg4, bg = colors.bg1 })
    hl("TabLineSel", { fg = colors.green, bg = colors.bg1, bold = config.bold })
  end
  
  -- ╭────────────╮
  -- │  Vertical  │
  -- │  Split     │
  -- ╰────────────╯
  
  hl("VertSplit", { fg = colors.bg3, bg = colors.bg0 })
  hl("WinSeparator", { fg = colors.bg3, bg = colors.bg0 })
  
  -- ╭───────────╮
  -- │  Folding  │
  -- ╰───────────╯
  
  hl("Folded", { fg = colors.gray, bg = colors.bg1, italic = config.italic })
  hl("FoldColumn", { fg = colors.gray, bg = colors.bg1 })
  
  -- ╭─────────────────╮
  -- │  Popup/Floating │
  -- ╰─────────────────╯
  
  hl("Pmenu", { fg = colors.fg1, bg = colors.bg2 })
  hl("PmenuSel", { fg = colors.bg2, bg = colors.blue, bold = config.bold })
  hl("PmenuSbar", { bg = colors.bg2 })
  hl("PmenuThumb", { bg = colors.bg4 })
  hl("FloatBorder", { fg = colors.fg4, bg = colors.bg1 })
  hl("FloatTitle", { fg = colors.green, bg = colors.bg1, bold = config.bold })
  
  -- ╭───────────────╮
  -- │  Wildmenu     │
  -- ╰───────────────╯
  
  hl("WildMenu", { fg = colors.blue, bg = colors.bg2, bold = config.bold })
  
  -- ╭─────────╮
  -- │  Diff   │
  -- ╰─────────╯
  
  hl("DiffAdd", { fg = colors.green, bg = colors.bg0, reverse = true })
  hl("DiffChange", { fg = colors.aqua, bg = colors.bg0, reverse = true })
  hl("DiffDelete", { fg = colors.red, bg = colors.bg0, reverse = true })
  hl("DiffText", { fg = colors.yellow, bg = colors.bg0, reverse = true })
  
  -- ╭──────────────╮
  -- │  Spell Check │
  -- ╰──────────────╯
  
  if config.improved_warnings then
    hl("SpellBad", { fg = colors.red, undercurl = config.undercurl, sp = colors.red })
    hl("SpellCap", { fg = colors.blue, undercurl = config.undercurl, sp = colors.blue })
    hl("SpellRare", { fg = colors.purple, undercurl = config.undercurl, sp = colors.purple })
    hl("SpellLocal", { fg = colors.aqua, undercurl = config.undercurl, sp = colors.aqua })
  else
    hl("SpellBad", { undercurl = config.undercurl, sp = colors.red })
    hl("SpellCap", { undercurl = config.undercurl, sp = colors.blue })
    hl("SpellRare", { undercurl = config.undercurl, sp = colors.purple })
    hl("SpellLocal", { undercurl = config.undercurl, sp = colors.aqua })
  end
  
  -- ╭──────────────╮
  -- │  Messages    │
  -- ╰──────────────╯
  
  hl("ErrorMsg", { fg = colors.bg0, bg = colors.red, bold = config.bold })
  hl("WarningMsg", { fg = colors.red, bold = config.bold })
  hl("ModeMsg", { fg = colors.yellow, bold = config.bold })
  hl("MoreMsg", { fg = colors.yellow, bold = config.bold })
  hl("Question", { fg = colors.orange, bold = config.bold })
  
  -- ╭───────────╮
  -- │  Special  │
  -- ╰───────────╯
  
  hl("NonText", { fg = colors.bg2 })
  hl("SpecialKey", { fg = colors.bg2 })
  hl("EndOfBuffer", { fg = colors.bg0 })
  hl("Whitespace", { fg = colors.bg2 })
  
  -- ╭──────────────╮
  -- │  Misc        │
  -- ╰──────────────╯
  
  hl("MatchParen", { bg = colors.bg3, bold = config.bold })
  hl("ColorColumn", { bg = colors.bg1 })
  hl("Conceal", { fg = colors.blue })
  hl("Directory", { fg = colors.green, bold = config.bold })
  hl("Title", { fg = colors.green, bold = config.bold })
  hl("Underlined", { fg = colors.blue, underline = config.underline })
  
  -- QuickFix
  hl("QuickFixLine", { fg = colors.purple, bold = config.bold })
  hl("qfLineNr", { fg = colors.yellow })
  hl("qfFileName", { fg = colors.blue })
  
  -- Debug
  hl("debugPC", { bg = colors.bg3 })
  hl("debugBreakpoint", { fg = colors.red, reverse = true })
end

return M

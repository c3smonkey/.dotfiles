-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox Syntax Highlights                              │
-- │  Standard Vim Syntax-Gruppen                            │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}
local utils = require("colorschemes.gruvbox.utils")

function M.apply(colors, config)
  local hl = utils.highlight
  local link = utils.link
  
  -- ╭──────────────╮
  -- │  Comments    │
  -- ╰──────────────╯
  
  hl("Comment", { fg = colors.gray, italic = config.italic })
  hl("Todo", { fg = colors.fg0, bg = colors.bg0, bold = config.bold, italic = config.italic })
  hl("Error", { fg = colors.red, bg = colors.bg0, bold = config.bold, reverse = true })
  
  -- ╭──────────────╮
  -- │  Constants   │
  -- ╰──────────────╯
  
  hl("Constant", { fg = colors.purple })
  hl("String", { 
    fg = config.improved_strings and colors.fg1 or colors.green,
    bg = config.improved_strings and colors.bg1 or colors.none,
    italic = config.italic
  })
  hl("Character", { fg = colors.purple })
  hl("Number", { fg = colors.purple })
  hl("Boolean", { fg = colors.purple })
  hl("Float", { fg = colors.purple })
  
  -- ╭──────────────╮
  -- │  Identifiers │
  -- ╰──────────────╯
  
  hl("Identifier", { fg = colors.blue })
  hl("Function", { fg = colors.green, bold = config.bold })
  
  -- ╭──────────────╮
  -- │  Statements  │
  -- ╰──────────────╯
  
  hl("Statement", { fg = colors.red })
  link("Conditional", "Statement")
  link("Repeat", "Statement")
  link("Label", "Statement")
  link("Exception", "Statement")
  link("Keyword", "Statement")
  hl("Operator", { fg = colors.fg1 })
  
  -- ╭──────────────╮
  -- │  PreProc     │
  -- ╰──────────────╯
  
  hl("PreProc", { fg = colors.aqua })
  link("Include", "PreProc")
  link("Define", "PreProc")
  link("Macro", "PreProc")
  link("PreCondit", "PreProc")
  
  -- ╭──────────────╮
  -- │  Types       │
  -- ╰──────────────╯
  
  hl("Type", { fg = colors.yellow })
  link("StorageClass", "Type")
  hl("Structure", { fg = colors.aqua })
  link("Typedef", "Type")
  
  -- ╭──────────────╮
  -- │  Special     │
  -- ╰──────────────╯
  
  hl("Special", {
    fg = colors.orange,
    bg = config.improved_strings and colors.bg1 or colors.none,
    italic = config.italic
  })
  link("SpecialChar", "Special")
  link("Tag", "Special")
  link("Delimiter", "Special")
  link("SpecialComment", "Special")
  link("Debug", "Special")
  
  -- ╭──────────────────╮
  -- │  Gruvbox Groups  │
  -- ╰──────────────────╯
  
  -- Foregrounds
  hl("GruvboxFg0", { fg = colors.fg0 })
  hl("GruvboxFg1", { fg = colors.fg1 })
  hl("GruvboxFg2", { fg = colors.fg2 })
  hl("GruvboxFg3", { fg = colors.fg3 })
  hl("GruvboxFg4", { fg = colors.fg4 })
  
  -- Backgrounds
  hl("GruvboxBg0", { fg = colors.bg0 })
  hl("GruvboxBg1", { fg = colors.bg1 })
  hl("GruvboxBg2", { fg = colors.bg2 })
  hl("GruvboxBg3", { fg = colors.bg3 })
  hl("GruvboxBg4", { fg = colors.bg4 })
  
  -- Gray
  hl("GruvboxGray", { fg = colors.gray })
  
  -- Colors
  hl("GruvboxRed", { fg = colors.red })
  hl("GruvboxRedBold", { fg = colors.red, bold = config.bold })
  hl("GruvboxGreen", { fg = colors.green })
  hl("GruvboxGreenBold", { fg = colors.green, bold = config.bold })
  hl("GruvboxYellow", { fg = colors.yellow })
  hl("GruvboxYellowBold", { fg = colors.yellow, bold = config.bold })
  hl("GruvboxBlue", { fg = colors.blue })
  hl("GruvboxBlueBold", { fg = colors.blue, bold = config.bold })
  hl("GruvboxPurple", { fg = colors.purple })
  hl("GruvboxPurpleBold", { fg = colors.purple, bold = config.bold })
  hl("GruvboxAqua", { fg = colors.aqua })
  hl("GruvboxAquaBold", { fg = colors.aqua, bold = config.bold })
  hl("GruvboxOrange", { fg = colors.orange })
  hl("GruvboxOrangeBold", { fg = colors.orange, bold = config.bold })
  
  -- Sign Column
  if config.invert_signs then
    hl("GruvboxRedSign", { fg = colors.red, bg = colors.bg0, reverse = true })
    hl("GruvboxGreenSign", { fg = colors.green, bg = colors.bg0, reverse = true })
    hl("GruvboxYellowSign", { fg = colors.yellow, bg = colors.bg0, reverse = true })
    hl("GruvboxBlueSign", { fg = colors.blue, bg = colors.bg0, reverse = true })
    hl("GruvboxPurpleSign", { fg = colors.purple, bg = colors.bg0, reverse = true })
    hl("GruvboxAquaSign", { fg = colors.aqua, bg = colors.bg0, reverse = true })
    hl("GruvboxOrangeSign", { fg = colors.orange, bg = colors.bg0, reverse = true })
  else
    hl("GruvboxRedSign", { fg = colors.red, bg = colors.bg0 })
    hl("GruvboxGreenSign", { fg = colors.green, bg = colors.bg0 })
    hl("GruvboxYellowSign", { fg = colors.yellow, bg = colors.bg0 })
    hl("GruvboxBlueSign", { fg = colors.blue, bg = colors.bg0 })
    hl("GruvboxPurpleSign", { fg = colors.purple, bg = colors.bg0 })
    hl("GruvboxAquaSign", { fg = colors.aqua, bg = colors.bg0 })
    hl("GruvboxOrangeSign", { fg = colors.orange, bg = colors.bg0 })
  end
end

return M

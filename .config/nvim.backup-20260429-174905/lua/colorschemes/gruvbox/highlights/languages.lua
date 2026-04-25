-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox Language-Specific Highlights                   │
-- │  Spezielle Highlights für bestimmte Sprachen            │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}
local utils = require("colorschemes.gruvbox.utils")

function M.apply(colors, config)
  local hl = utils.highlight
  local link = utils.link
  
  -- ╭──────────────╮
  -- │  Markdown    │
  -- ╰──────────────╯
  
  hl("markdownH1", { fg = colors.green, bold = config.bold })
  hl("markdownH2", { fg = colors.yellow, bold = config.bold })
  hl("markdownH3", { fg = colors.orange, bold = config.bold })
  hl("markdownH4", { fg = colors.red, bold = config.bold })
  hl("markdownH5", { fg = colors.purple, bold = config.bold })
  hl("markdownH6", { fg = colors.aqua, bold = config.bold })
  
  hl("markdownCode", { fg = colors.orange })
  hl("markdownCodeBlock", { fg = colors.orange })
  hl("markdownCodeDelimiter", { fg = colors.orange })
  
  hl("markdownItalic", { fg = colors.fg1, italic = config.italic })
  hl("markdownBold", { fg = colors.fg1, bold = config.bold })
  hl("markdownBoldItalic", { fg = colors.fg1, bold = config.bold, italic = config.italic })
  
  hl("markdownUrl", { fg = colors.blue, underline = config.underline })
  hl("markdownLinkText", { fg = colors.aqua })
  hl("markdownLinkDelimiter", { fg = colors.gray })
  
  link("markdownListMarker", "GruvboxRed")
  link("markdownOrderedListMarker", "GruvboxRed")
  
  -- ╭──────────────╮
  -- │  HTML/XML    │
  -- ╰──────────────╯
  
  link("htmlTag", "GruvboxAqua")
  link("htmlEndTag", "GruvboxAqua")
  link("htmlTagName", "GruvboxBlue")
  link("htmlArg", "GruvboxOrange")
  link("htmlSpecialChar", "GruvboxRed")
  link("htmlSpecialTagName", "GruvboxBlue")
  
  link("xmlTag", "htmlTag")
  link("xmlEndTag", "htmlEndTag")
  link("xmlTagName", "htmlTagName")
  link("xmlAttrib", "htmlArg")
  
  -- ╭──────────────╮
  -- │  CSS         │
  -- ╰──────────────╯
  
  link("cssClassName", "GruvboxYellow")
  link("cssIdentifier", "GruvboxOrange")
  link("cssFunction", "GruvboxYellow")
  link("cssProp", "GruvboxAqua")
  link("cssAttr", "GruvboxOrange")
  link("cssValueLength", "GruvboxPurple")
  link("cssValueNumber", "GruvboxPurple")
  link("cssColor", "GruvboxRed")
  
  -- ╭──────────────╮
  -- │  JavaScript  │
  -- ╰──────────────╯
  
  link("javaScriptBraces", "GruvboxFg1")
  link("javaScriptFunction", "GruvboxRed")
  link("javaScriptIdentifier", "GruvboxRed")
  link("javaScriptMember", "GruvboxBlue")
  link("javaScriptNumber", "GruvboxPurple")
  link("javaScriptNull", "GruvboxPurple")
  link("javaScriptStatement", "GruvboxRed")
  
  -- ╭──────────────╮
  -- │  TypeScript  │
  -- ╰──────────────╯
  
  link("typescriptReserved", "GruvboxRed")
  link("typescriptLabel", "GruvboxRed")
  link("typescriptFuncKeyword", "GruvboxRed")
  link("typescriptIdentifier", "GruvboxOrange")
  link("typescriptBraces", "GruvboxFg1")
  link("typescriptEndColons", "GruvboxFg1")
  link("typescriptParens", "GruvboxFg3")
  
  -- ╭──────────────╮
  -- │  Python      │
  -- ╰──────────────╯
  
  link("pythonStatement", "GruvboxRed")
  link("pythonConditional", "GruvboxRed")
  link("pythonRepeat", "GruvboxRed")
  link("pythonOperator", "GruvboxRed")
  link("pythonException", "GruvboxRed")
  link("pythonInclude", "GruvboxRed")
  link("pythonDecorator", "GruvboxRed")
  link("pythonDecoratorName", "GruvboxAqua")
  link("pythonFunction", "GruvboxGreenBold")
  link("pythonBuiltinObj", "GruvboxOrange")
  link("pythonBuiltinFunc", "GruvboxOrange")
  
  -- ╭──────────────╮
  -- │  Go          │
  -- ╰──────────────╯
  
  link("goDirective", "GruvboxAqua")
  link("goConstants", "GruvboxPurple")
  link("goDeclType", "GruvboxRed")
  link("goStatement", "GruvboxRed")
  link("goConditional", "GruvboxRed")
  link("goRepeat", "GruvboxRed")
  link("goType", "GruvboxYellow")
  link("goSignedInts", "GruvboxYellow")
  link("goUnsignedInts", "GruvboxYellow")
  link("goBuiltins", "GruvboxOrange")
  
  -- ╭──────────────╮
  -- │  Rust        │
  -- ╰──────────────╯
  
  link("rustModPath", "GruvboxAqua")
  link("rustMacro", "GruvboxAqua")
  link("rustKeyword", "GruvboxRed")
  link("rustDerive", "GruvboxAqua")
  link("rustAttribute", "GruvboxGray")
  link("rustStorage", "GruvboxOrange")
  link("rustTrait", "GruvboxYellow")
  link("rustType", "GruvboxYellow")
  
  -- ╭──────────────╮
  -- │  Lua         │
  -- ╰──────────────╯
  
  link("luaFunc", "GruvboxGreenBold")
  link("luaFunction", "GruvboxRed")
  link("luaTable", "GruvboxOrange")
  link("luaIn", "GruvboxRed")
end

return M

-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox Treesitter Highlights                          │
-- │  Treesitter Syntax Groups (Neovim 0.8+)                 │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}
local utils = require("colorschemes.gruvbox.utils")

function M.apply(colors, config)
  local hl = utils.highlight
  local link = utils.link
  
  -- ╭──────────────────╮
  -- │  Misc            │
  -- ╰──────────────────╯
  
  link("@error", "Error")
  hl("@comment", { fg = colors.gray, italic = config.italic })
  hl("@comment.documentation", { fg = colors.gray, italic = config.italic })
  hl("@comment.error", { fg = colors.red })
  hl("@comment.warning", { fg = colors.yellow })
  hl("@comment.todo", { fg = colors.purple, bold = config.bold })
  hl("@comment.note", { fg = colors.blue, bold = config.bold })
  
  -- ╭──────────────────╮
  -- │  Constants       │
  -- ╰──────────────────╯
  
  link("@constant", "Constant")
  link("@constant.builtin", "Constant")
  link("@constant.macro", "Constant")
  link("@string", "String")
  link("@string.documentation", "String")
  link("@string.regexp", "String")
  link("@string.escape", "SpecialChar")
  link("@string.special", "Special")
  link("@character", "Character")
  link("@character.special", "SpecialChar")
  link("@number", "Number")
  link("@boolean", "Boolean")
  link("@float", "Float")
  
  -- ╭──────────────────╮
  -- │  Functions       │
  -- ╰──────────────────╯
  
  link("@function", "Function")
  link("@function.builtin", "Function")
  link("@function.call", "Function")
  link("@function.macro", "Macro")
  hl("@function.method", { fg = colors.green, bold = config.bold })
  hl("@function.method.call", { fg = colors.green })
  link("@constructor", "Function")
  link("@operator", "Operator")
  
  -- ╭──────────────────╮
  -- │  Keywords        │
  -- ╰──────────────────╯
  
  link("@keyword", "Keyword")
  link("@keyword.function", "Keyword")
  link("@keyword.operator", "Keyword")
  link("@keyword.return", "Keyword")
  link("@keyword.import", "Include")
  link("@keyword.conditional", "Conditional")
  link("@keyword.repeat", "Repeat")
  link("@keyword.exception", "Exception")
  link("@keyword.directive", "PreProc")
  
  -- ╭──────────────────╮
  -- │  Types           │
  -- ╰──────────────────╯
  
  link("@type", "Type")
  link("@type.builtin", "Type")
  link("@type.definition", "Typedef")
  link("@type.qualifier", "Type")
  hl("@storageclass", { fg = colors.orange })
  link("@attribute", "PreProc")
  link("@field", "Identifier")
  link("@property", "Identifier")
  
  -- ╭──────────────────╮
  -- │  Identifiers     │
  -- ╰──────────────────╯
  
  hl("@variable", { fg = colors.fg1 })
  hl("@variable.builtin", { fg = colors.orange })
  hl("@variable.parameter", { fg = colors.blue })
  hl("@variable.member", { fg = colors.blue })
  link("@module", "Include")
  link("@namespace", "Include")
  link("@label", "Label")
  
  -- ╭──────────────────╮
  -- │  Text            │
  -- ╰──────────────────╯
  
  hl("@text", { fg = colors.fg1 })
  hl("@text.strong", { bold = config.bold })
  hl("@text.emphasis", { italic = config.italic })
  hl("@text.underline", { underline = config.underline })
  hl("@text.strike", { strikethrough = true })
  hl("@text.title", { fg = colors.green, bold = config.bold })
  hl("@text.literal", { fg = colors.orange })
  hl("@text.uri", { fg = colors.blue, underline = config.underline })
  link("@text.math", "Special")
  link("@text.reference", "Constant")
  link("@text.environment", "Macro")
  link("@text.environment.name", "Type")
  
  hl("@text.note", { fg = colors.blue, bold = config.bold })
  hl("@text.warning", { fg = colors.yellow, bold = config.bold })
  hl("@text.danger", { fg = colors.red, bold = config.bold })
  
  -- ╭──────────────────╮
  -- │  Tags            │
  -- ╰──────────────────╯
  
  link("@tag", "Tag")
  link("@tag.attribute", "Identifier")
  link("@tag.delimiter", "Delimiter")
  
  -- ╭──────────────────╮
  -- │  Punctuation     │
  -- ╰──────────────────╯
  
  hl("@punctuation.delimiter", { fg = colors.fg3 })
  hl("@punctuation.bracket", { fg = colors.fg3 })
  hl("@punctuation.special", { fg = colors.orange })
  
  -- ╭──────────────────╮
  -- │  Markup          │
  -- ╰──────────────────╯
  
  hl("@markup.strong", { bold = config.bold })
  hl("@markup.italic", { italic = config.italic })
  hl("@markup.strikethrough", { strikethrough = true })
  hl("@markup.underline", { underline = config.underline })
  
  hl("@markup.heading", { fg = colors.green, bold = config.bold })
  hl("@markup.heading.1", { fg = colors.green, bold = config.bold })
  hl("@markup.heading.2", { fg = colors.yellow, bold = config.bold })
  hl("@markup.heading.3", { fg = colors.orange, bold = config.bold })
  hl("@markup.heading.4", { fg = colors.red, bold = config.bold })
  hl("@markup.heading.5", { fg = colors.purple, bold = config.bold })
  hl("@markup.heading.6", { fg = colors.aqua, bold = config.bold })
  
  hl("@markup.quote", { fg = colors.gray, italic = config.italic })
  hl("@markup.math", { fg = colors.purple })
  hl("@markup.environment", { fg = colors.aqua })
  
  hl("@markup.link", { fg = colors.blue, underline = config.underline })
  hl("@markup.link.label", { fg = colors.aqua })
  hl("@markup.link.url", { fg = colors.blue, underline = config.underline })
  
  hl("@markup.raw", { fg = colors.orange })
  hl("@markup.raw.block", { fg = colors.orange })
  
  hl("@markup.list", { fg = colors.red })
  hl("@markup.list.checked", { fg = colors.green })
  hl("@markup.list.unchecked", { fg = colors.gray })
  
  -- ╭──────────────────╮
  -- │  Diff            │
  -- ╰──────────────────╯
  
  link("@diff.plus", "DiffAdd")
  link("@diff.minus", "DiffDelete")
  link("@diff.delta", "DiffChange")
end

return M

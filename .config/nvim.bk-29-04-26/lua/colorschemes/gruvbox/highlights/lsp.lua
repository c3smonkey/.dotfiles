-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox LSP Highlights                                 │
-- │  LSP Diagnostics & Semantic Tokens                      │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}
local utils = require("colorschemes.gruvbox.utils")

function M.apply(colors, config)
  local hl = utils.highlight
  local link = utils.link
  
  -- ╭──────────────────────╮
  -- │  LSP Diagnostics     │
  -- ╰──────────────────────╯
  
  -- Error
  hl("DiagnosticError", { fg = colors.red })
  hl("DiagnosticSignError", { fg = colors.red, bg = colors.bg0 })
  hl("DiagnosticUnderlineError", { undercurl = config.undercurl, sp = colors.red })
  hl("DiagnosticVirtualTextError", { fg = colors.red, bg = colors.bg0 })
  
  -- Warning
  hl("DiagnosticWarn", { fg = colors.yellow })
  hl("DiagnosticSignWarn", { fg = colors.yellow, bg = colors.bg0 })
  hl("DiagnosticUnderlineWarn", { undercurl = config.undercurl, sp = colors.yellow })
  hl("DiagnosticVirtualTextWarn", { fg = colors.yellow, bg = colors.bg0 })
  
  -- Info
  hl("DiagnosticInfo", { fg = colors.blue })
  hl("DiagnosticSignInfo", { fg = colors.blue, bg = colors.bg0 })
  hl("DiagnosticUnderlineInfo", { undercurl = config.undercurl, sp = colors.blue })
  hl("DiagnosticVirtualTextInfo", { fg = colors.blue, bg = colors.bg0 })
  
  -- Hint
  hl("DiagnosticHint", { fg = colors.aqua })
  hl("DiagnosticSignHint", { fg = colors.aqua, bg = colors.bg0 })
  hl("DiagnosticUnderlineHint", { undercurl = config.undercurl, sp = colors.aqua })
  hl("DiagnosticVirtualTextHint", { fg = colors.aqua, bg = colors.bg0 })
  
  -- Ok
  hl("DiagnosticOk", { fg = colors.green })
  hl("DiagnosticSignOk", { fg = colors.green, bg = colors.bg0 })
  hl("DiagnosticUnderlineOk", { undercurl = config.undercurl, sp = colors.green })
  hl("DiagnosticVirtualTextOk", { fg = colors.green, bg = colors.bg0 })
  
  -- ╭──────────────────────╮
  -- │  LSP References      │
  -- ╰──────────────────────╯
  
  hl("LspReferenceText", { bg = colors.bg2 })
  hl("LspReferenceRead", { bg = colors.bg2 })
  hl("LspReferenceWrite", { bg = colors.bg2, bold = config.bold })
  
  hl("LspSignatureActiveParameter", { fg = colors.orange, bold = config.bold })
  hl("LspCodeLens", { fg = colors.gray })
  hl("LspCodeLensSeparator", { fg = colors.gray })
  
  -- ╭──────────────────────╮
  -- │  LSP Inlay Hints     │
  -- ╰──────────────────────╯
  
  hl("LspInlayHint", { fg = colors.bg4, bg = colors.bg1 })
  
  -- ╭──────────────────────╮
  -- │  Semantic Tokens     │
  -- ╰──────────────────────╯
  
  link("@lsp.type.class", "Type")
  link("@lsp.type.comment", "Comment")
  link("@lsp.type.decorator", "Function")
  link("@lsp.type.enum", "Type")
  link("@lsp.type.enumMember", "Constant")
  link("@lsp.type.function", "Function")
  link("@lsp.type.interface", "Type")
  link("@lsp.type.macro", "Macro")
  link("@lsp.type.method", "Function")
  link("@lsp.type.namespace", "Include")
  link("@lsp.type.parameter", "@variable.parameter")
  link("@lsp.type.property", "Identifier")
  link("@lsp.type.struct", "Type")
  link("@lsp.type.type", "Type")
  link("@lsp.type.typeParameter", "Type")
  link("@lsp.type.variable", "@variable")
  
  -- Modifiers
  hl("@lsp.mod.deprecated", { fg = colors.gray, strikethrough = true })
  hl("@lsp.mod.readonly", { fg = colors.purple })
end

return M

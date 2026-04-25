-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox Plugin Highlights                              │
-- │  Häufig genutzte Neovim Plugins                         │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}
local utils = require("colorschemes.gruvbox.utils")

function M.apply(colors, config)
  local hl = utils.highlight
  local link = utils.link
  
  -- ╭──────────────╮
  -- │  GitSigns    │
  -- ╰──────────────╯
  
  hl("GitSignsAdd", { fg = colors.green, bg = colors.bg0 })
  hl("GitSignsChange", { fg = colors.aqua, bg = colors.bg0 })
  hl("GitSignsDelete", { fg = colors.red, bg = colors.bg0 })
  
  -- ╭──────────────╮
  -- │  Telescope   │
  -- ╰──────────────╯
  
  link("TelescopeBorder", "FloatBorder")
  link("TelescopePromptBorder", "FloatBorder")
  link("TelescopeResultsBorder", "FloatBorder")
  link("TelescopePreviewBorder", "FloatBorder")
  
  hl("TelescopeSelection", { fg = colors.yellow, bg = colors.bg2, bold = config.bold })
  hl("TelescopeSelectionCaret", { fg = colors.red, bg = colors.bg2 })
  hl("TelescopeMultiSelection", { fg = colors.gray, bg = colors.bg2 })
  
  hl("TelescopeMatching", { fg = colors.blue, bold = config.bold })
  
  -- ╭──────────────╮
  -- │  NvimTree    │
  -- ╰──────────────╯
  
  hl("NvimTreeNormal", { fg = colors.fg1, bg = colors.bg0 })
  hl("NvimTreeFolderName", { fg = colors.blue })
  hl("NvimTreeFolderIcon", { fg = colors.yellow })
  hl("NvimTreeOpenedFolderName", { fg = colors.blue, bold = config.bold })
  hl("NvimTreeEmptyFolderName", { fg = colors.gray })
  hl("NvimTreeSymlink", { fg = colors.aqua })
  hl("NvimTreeExecFile", { fg = colors.green, bold = config.bold })
  hl("NvimTreeSpecialFile", { fg = colors.orange, underline = config.underline })
  hl("NvimTreeImageFile", { fg = colors.purple })
  
  hl("NvimTreeGitDirty", { fg = colors.yellow })
  hl("NvimTreeGitStaged", { fg = colors.green })
  hl("NvimTreeGitMerge", { fg = colors.orange })
  hl("NvimTreeGitRenamed", { fg = colors.purple })
  hl("NvimTreeGitNew", { fg = colors.aqua })
  hl("NvimTreeGitDeleted", { fg = colors.red })
  
  -- ╭──────────────╮
  -- │  Neo-tree    │
  -- ╰──────────────╯
  
  link("NeoTreeNormal", "NvimTreeNormal")
  link("NeoTreeDirectoryName", "NvimTreeFolderName")
  link("NeoTreeDirectoryIcon", "NvimTreeFolderIcon")
  link("NeoTreeGitModified", "NvimTreeGitDirty")
  link("NeoTreeGitAdded", "NvimTreeGitNew")
  link("NeoTreeGitDeleted", "NvimTreeGitDeleted")
  
  -- ╭──────────────╮
  -- │  WhichKey    │
  -- ╰──────────────╯
  
  hl("WhichKey", { fg = colors.red, bold = config.bold })
  hl("WhichKeyGroup", { fg = colors.orange })
  hl("WhichKeySeparator", { fg = colors.green })
  hl("WhichKeyDesc", { fg = colors.blue })
  hl("WhichKeyFloat", { bg = colors.bg1 })
  
  -- ╭──────────────╮
  -- │  Dashboard   │
  -- ╰──────────────╯
  
  hl("DashboardHeader", { fg = colors.orange, bold = config.bold })
  hl("DashboardCenter", { fg = colors.yellow })
  hl("DashboardShortCut", { fg = colors.blue })
  hl("DashboardFooter", { fg = colors.gray, italic = config.italic })
  
  -- ╭──────────────╮
  -- │  Notify      │
  -- ╰──────────────╯
  
  hl("NotifyERRORBorder", { fg = colors.red })
  hl("NotifyWARNBorder", { fg = colors.yellow })
  hl("NotifyINFOBorder", { fg = colors.blue })
  hl("NotifyDEBUGBorder", { fg = colors.gray })
  hl("NotifyTRACEBorder", { fg = colors.purple })
  
  hl("NotifyERRORTitle", { fg = colors.red, bold = config.bold })
  hl("NotifyWARNTitle", { fg = colors.yellow, bold = config.bold })
  hl("NotifyINFOTitle", { fg = colors.blue, bold = config.bold })
  hl("NotifyDEBUGTitle", { fg = colors.gray, bold = config.bold })
  hl("NotifyTRACETitle", { fg = colors.purple, bold = config.bold })
  
  -- ╭──────────────╮
  -- │  Noice       │
  -- ╰──────────────╯
  
  link("NoiceCmdlinePopup", "Pmenu")
  link("NoiceCmdlinePopupBorder", "FloatBorder")
  link("NoiceConfirm", "Pmenu")
  link("NoiceConfirmBorder", "FloatBorder")
end

return M

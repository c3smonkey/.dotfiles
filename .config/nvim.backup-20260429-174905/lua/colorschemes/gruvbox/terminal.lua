-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox Terminal Colors                                │
-- │  Terminal-Farben für integriertes Terminal              │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

function M.apply(colors)
  -- Terminal Colors setzen (Neovim built-in terminal)
  vim.g.terminal_color_0  = colors.bg0          -- Black
  vim.g.terminal_color_8  = colors.gray         -- Bright Black
  
  vim.g.terminal_color_1  = colors.neutral_red  -- Red
  vim.g.terminal_color_9  = colors.red          -- Bright Red
  
  vim.g.terminal_color_2  = colors.neutral_green  -- Green
  vim.g.terminal_color_10 = colors.green          -- Bright Green
  
  vim.g.terminal_color_3  = colors.neutral_yellow -- Yellow
  vim.g.terminal_color_11 = colors.yellow         -- Bright Yellow
  
  vim.g.terminal_color_4  = colors.neutral_blue   -- Blue
  vim.g.terminal_color_12 = colors.blue           -- Bright Blue
  
  vim.g.terminal_color_5  = colors.neutral_purple -- Magenta
  vim.g.terminal_color_13 = colors.purple         -- Bright Magenta
  
  vim.g.terminal_color_6  = colors.neutral_aqua   -- Cyan
  vim.g.terminal_color_14 = colors.aqua           -- Bright Cyan
  
  vim.g.terminal_color_7  = colors.fg4            -- White
  vim.g.terminal_color_15 = colors.fg1            -- Bright White
end

return M

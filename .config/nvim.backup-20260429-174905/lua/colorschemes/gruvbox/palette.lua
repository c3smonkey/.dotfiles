-- ╭─────────────────────────────────────────────────────────╮
-- │  Gruvbox Farb-Palette                                   │
-- │  Alle Farbwerte für dark & light themes                 │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

-- ╭───────────────────╮
-- │  Base Colors      │
-- ╰───────────────────╯

-- Absolute colors (unabhängig von dark/light)
M.base = {
  -- Dark backgrounds
  dark0_hard  = "#1d2021",
  dark0       = "#282828",
  dark0_soft  = "#32302f",
  dark1       = "#3c3836",
  dark2       = "#504945",
  dark3       = "#665c54",
  dark4       = "#7c6f64",
  
  -- Light backgrounds
  light0_hard = "#f9f5d7",
  light0      = "#fbf1c7",
  light0_soft = "#f2e5bc",
  light1      = "#ebdbb2",
  light2      = "#d5c4a1",
  light3      = "#bdae93",
  light4      = "#a89984",
  
  -- Gray
  gray = "#928374",
  
  -- Bright colors (für dark theme)
  bright_red     = "#fb4934",
  bright_green   = "#b8bb26",
  bright_yellow  = "#fabd2f",
  bright_blue    = "#83a598",
  bright_purple  = "#d3869b",
  bright_aqua    = "#8ec07c",
  bright_orange  = "#fe8019",
  
  -- Neutral colors
  neutral_red    = "#cc241d",
  neutral_green  = "#98971a",
  neutral_yellow = "#d79921",
  neutral_blue   = "#458588",
  neutral_purple = "#b16286",
  neutral_aqua   = "#689d6a",
  neutral_orange = "#d65d0e",
  
  -- Faded colors (für light theme)
  faded_red      = "#9d0006",
  faded_green    = "#79740e",
  faded_yellow   = "#b57614",
  faded_blue     = "#076678",
  faded_purple   = "#8f3f71",
  faded_aqua     = "#427b58",
  faded_orange   = "#af3a03",
}

-- ╭──────────────────────╮
-- │  Generate Palette    │
-- ╰──────────────────────╯

function M.get(background, contrast)
  background = background or "dark"
  contrast = contrast or "medium"
  
  local colors = {}
  
  if background == "dark" then
    -- Dark Theme
    -- Background (abhängig von contrast)
    if contrast == "hard" then
      colors.bg0 = M.base.dark0_hard
    elseif contrast == "soft" then
      colors.bg0 = M.base.dark0_soft
    else
      colors.bg0 = M.base.dark0
    end
    
    colors.bg1 = M.base.dark1
    colors.bg2 = M.base.dark2
    colors.bg3 = M.base.dark3
    colors.bg4 = M.base.dark4
    
    -- Foreground
    colors.fg0 = M.base.light0
    colors.fg1 = M.base.light1
    colors.fg2 = M.base.light2
    colors.fg3 = M.base.light3
    colors.fg4 = M.base.light4
    
    -- Colors (bright für dark theme)
    colors.red    = M.base.bright_red
    colors.green  = M.base.bright_green
    colors.yellow = M.base.bright_yellow
    colors.blue   = M.base.bright_blue
    colors.purple = M.base.bright_purple
    colors.aqua   = M.base.bright_aqua
    colors.orange = M.base.bright_orange
    
    -- Neutral (für weniger wichtige Elemente)
    colors.neutral_red    = M.base.neutral_red
    colors.neutral_green  = M.base.neutral_green
    colors.neutral_yellow = M.base.neutral_yellow
    colors.neutral_blue   = M.base.neutral_blue
    colors.neutral_purple = M.base.neutral_purple
    colors.neutral_aqua   = M.base.neutral_aqua
    colors.neutral_orange = M.base.neutral_orange
    
  else
    -- Light Theme
    -- Background
    if contrast == "hard" then
      colors.bg0 = M.base.light0_hard
    elseif contrast == "soft" then
      colors.bg0 = M.base.light0_soft
    else
      colors.bg0 = M.base.light0
    end
    
    colors.bg1 = M.base.light1
    colors.bg2 = M.base.light2
    colors.bg3 = M.base.light3
    colors.bg4 = M.base.light4
    
    -- Foreground
    colors.fg0 = M.base.dark0
    colors.fg1 = M.base.dark1
    colors.fg2 = M.base.dark2
    colors.fg3 = M.base.dark3
    colors.fg4 = M.base.dark4
    
    -- Colors (faded für light theme)
    colors.red    = M.base.faded_red
    colors.green  = M.base.faded_green
    colors.yellow = M.base.faded_yellow
    colors.blue   = M.base.faded_blue
    colors.purple = M.base.faded_purple
    colors.aqua   = M.base.faded_aqua
    colors.orange = M.base.faded_orange
    
    -- Neutral
    colors.neutral_red    = M.base.neutral_red
    colors.neutral_green  = M.base.neutral_green
    colors.neutral_yellow = M.base.neutral_yellow
    colors.neutral_blue   = M.base.neutral_blue
    colors.neutral_purple = M.base.neutral_purple
    colors.neutral_aqua   = M.base.neutral_aqua
    colors.neutral_orange = M.base.neutral_orange
  end
  
  -- Gray (gleich für beide)
  colors.gray = M.base.gray
  
  -- Special
  colors.none = "NONE"
  
  return colors
end

return M

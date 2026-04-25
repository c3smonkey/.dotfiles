-- ============================================
-- Colorscheme Konfiguration: mini.hues
-- ============================================

-- Farbpaletten-Presets
local presets = {
  azure = {
    bg = '#11262d',
    fg = '#c0c8cc',
    name = 'Azure Winter',
    description = 'Icy winter palette with cyan-blue background'
  },
  blue = {
    bg = '#19213a',
    fg = '#c4c6cd',
    name = 'Classic Blue',
    description = 'Deep blue night sky palette'
  },
  forest = {
    bg = '#17280e',
    fg = '#c4c8c2',
    name = 'Forest Green',
    description = 'Natural forest palette with green background'
  },
  purple = {
    bg = '#2b1a33',
    fg = '#c9c5cb',
    name = 'Mystic Purple',
    description = 'Mystical purple palette for creative work'
  },
  sunset = {
    bg = '#361a0d',
    fg = '#cdc5c1',
    name = 'Warm Sunset',
    description = 'Warm orange-brown sunset palette'
  },
  gray = {
    bg = '#1a1a1a',
    fg = '#c9c9c9',
    name = 'Neutral Gray',
    description = 'Minimalist monochrome palette'
  },
}

-- Aktive Palette wählen (hier ändern zum Wechseln!)
local active_preset = 'blue'

-- Validierung: Falls Preset nicht existiert, Fallback zu azure
if not presets[active_preset] then
  vim.notify(
    'Colorscheme: Unknown preset "' .. active_preset .. '", falling back to "azure"',
    vim.log.levels.WARN
  )
  active_preset = 'azure'
end

local colors = presets[active_preset]

-- Info: Zeige aktive Palette beim Start
vim.notify('Colorscheme: ' .. colors.name .. ' (' .. active_preset .. ')', vim.log.levels.INFO)

-- mini.hues Setup mit ausgewählter Palette
require('mini.hues').setup({
  background = colors.bg,
  foreground = colors.fg,
  n_hues = 8,              -- Volle Farbpalette
  saturation = 'medium',   -- Ausgewogene Sättigung
  accent = 'bg',           -- Akzentfarbe basiert auf Hintergrund
})

-- ============================================
-- Transparenz-Konfiguration
-- ============================================

-- Funktion: Setzt transparenten Hintergrund für alle UI-Elemente
local function set_transparent_bg()
  local hl_groups = {
    -- Normale Bereiche
    'Normal',
    'NormalFloat',
    'NormalNC',
    
    -- UI-Elemente
    'SignColumn',
    'LineNr',
    'LineNrAbove',
    'LineNrBelow',
    'CursorLineNr',
    'FoldColumn',
    'Folded',
    'VertSplit',
    'WinSeparator',
    
    -- Statusline und Tabline
    'StatusLine',
    'StatusLineNC',
    'TabLine',
    'TabLineFill',
    
    -- Floating Windows
    'FloatBorder',
    'FloatTitle',
    
    -- Popup-Menüs
    'Pmenu',
    'PmenuSbar',
    'PmenuThumb',
  }
  
  for _, group in ipairs(hl_groups) do
    vim.api.nvim_set_hl(0, group, { bg = 'NONE' })
  end
end

-- Transparenz sofort anwenden
set_transparent_bg()

-- Transparenz auch nach ColorScheme-Änderungen beibehalten
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = set_transparent_bg,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │  Colorscheme Loader                                     │
-- │  Unterstützt mehrere Colorschemes                       │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

-- ╭─────────────────────╮
-- │  Konfiguration      │
-- ╰─────────────────────╯

M.config = {
  -- Aktives Colorscheme (ändern zum Wechseln)
  active = "gruvbox",
  
  -- Verfügbare Colorschemes
  available = {
    "gruvbox",
    -- Zukünftige Schemes hier hinzufügen:
    -- "catppuccin",
    -- "tokyonight",
    -- "nord",
  },
  
  -- Standard-Transparenz Modus
  transparency = "moderate",  -- none | minimal | moderate | full
}

-- ╭─────────────────────╮
-- │  Colorscheme laden  │
-- ╰─────────────────────╯

function M.load(name)
  name = name or M.config.active
  
  -- Prüfen ob Scheme verfügbar ist
  local available = false
  for _, scheme in ipairs(M.config.available) do
    if scheme == name then
      available = true
      break
    end
  end
  
  if not available then
    vim.notify(
      string.format("Colorscheme '%s' nicht verfügbar", name),
      vim.log.levels.ERROR
    )
    return false
  end
  
  -- Scheme-Modul laden
  local ok, scheme = pcall(require, "colorschemes." .. name)
  if not ok then
    vim.notify(
      string.format("Fehler beim Laden von '%s': %s", name, scheme),
      vim.log.levels.ERROR
    )
    return false
  end
  
  -- Scheme setup aufrufen
  if type(scheme.setup) == "function" then
    scheme.setup()
  else
    vim.notify(
      string.format("Colorscheme '%s' hat keine setup() Funktion", name),
      vim.log.levels.ERROR
    )
    return false
  end
  
  -- Transparenz anwenden
  local transparency = require("colorschemes.transparency")
  transparency.apply(M.config.transparency)
  
  -- Aktuelles Scheme speichern
  M.config.active = name
  
  return true
end

-- ╭──────────────────────╮
-- │  User Commands       │
-- ╰──────────────────────╯

-- :ColorschemeLoad <name>
vim.api.nvim_create_user_command("ColorschemeLoad", function(opts)
  M.load(opts.args)
end, {
  nargs = 1,
  complete = function()
    return M.config.available
  end,
  desc = "Colorscheme laden",
})

-- :ColorschemeList
vim.api.nvim_create_user_command("ColorschemeList", function()
  vim.notify(
    "Verfügbare Colorschemes:\n" .. table.concat(M.config.available, "\n"),
    vim.log.levels.INFO
  )
end, {
  desc = "Verfügbare Colorschemes auflisten",
})

-- ╭─────────────╮
-- │  Auto-Load  │
-- ╰─────────────╯

-- Aktives Colorscheme automatisch laden
M.load()

return M

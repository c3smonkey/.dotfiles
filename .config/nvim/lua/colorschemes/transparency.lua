-- ╭─────────────────────────────────────────────────────────╮
-- │  Transparenz-Management                                 │
-- │  Unterstützt mehrere Transparenz-Modi                   │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

-- ╭────────────────────╮
-- │  Transparenz-Modi  │
-- ╰────────────────────╯

M.modes = {
  none = {
    name = "Keine Transparenz",
    description = "Solid Gruvbox - maximale Lesbarkeit",
    highlights = {}
  },
  
  minimal = {
    name = "Minimal",
    description = "Nur Haupttext transparent",
    highlights = {
      { "Normal", { bg = "NONE" } }
    }
  },
  
  moderate = {
    name = "Moderat",
    description = "Text + Dateiende transparent (empfohlen)",
    highlights = {
      { "Normal", { bg = "NONE" } },
      { "EndOfBuffer", { bg = "NONE" } }
    }
  },
  
  full = {
    name = "Maximal",
    description = "Alles transparent - voller layered effect",
    highlights = {
      { "Normal", { bg = "NONE" } },
      { "NormalFloat", { bg = "NONE" } },
      { "LineNr", { bg = "NONE" } },
      { "SignColumn", { bg = "NONE" } },
      { "EndOfBuffer", { bg = "NONE" } },
    }
  }
}

-- Aktueller Modus (Standard: moderate)
M.current_mode = "moderate"

-- ╭─────────────────────────╮
-- │  Transparenz anwenden   │
-- ╰─────────────────────────╯

function M.apply(mode)
  mode = mode or M.current_mode
  
  -- Validierung
  if not M.modes[mode] then
    vim.notify(
      string.format("Unbekannter Transparenz-Modus: '%s'", mode),
      vim.log.levels.ERROR
    )
    return false
  end
  
  -- Modus speichern
  M.current_mode = mode
  local config = M.modes[mode]
  
  -- Highlights setzen (Neovim 0.12 API)
  for _, hl in ipairs(config.highlights) do
    vim.api.nvim_set_hl(0, hl[1], hl[2])
  end
  
  -- Notification
  vim.notify(
    string.format("Transparenz: %s", config.name),
    vim.log.levels.INFO
  )
  
  return true
end

-- ╭──────────────────────────╮
-- │  Toggle durch alle Modi  │
-- ╰──────────────────────────╯

function M.cycle()
  local order = { "none", "minimal", "moderate", "full" }
  local current_idx = 1
  
  -- Aktuellen Index finden
  for i, mode in ipairs(order) do
    if mode == M.current_mode then
      current_idx = i
      break
    end
  end
  
  -- Nächsten Modus auswählen (cycle)
  local next_idx = (current_idx % #order) + 1
  M.apply(order[next_idx])
end

-- ╭───────────────────╮
-- │  Info anzeigen    │
-- ╰───────────────────╯

function M.info()
  local current = M.modes[M.current_mode]
  local info_lines = {
    "Transparenz-Modus:",
    string.format("  Aktuell: %s (%s)", current.name, current.description),
    "",
    "Verfügbare Modi:",
  }
  
  for mode, config in pairs(M.modes) do
    local marker = (mode == M.current_mode) and "→ " or "  "
    table.insert(info_lines, string.format("%s%s: %s", marker, config.name, config.description))
  end
  
  vim.notify(table.concat(info_lines, "\n"), vim.log.levels.INFO)
end

-- ╭──────────────────────╮
-- │  User Commands       │
-- ╰──────────────────────╯

-- :TransparencySet <mode>
vim.api.nvim_create_user_command("TransparencySet", function(opts)
  M.apply(opts.args)
end, {
  nargs = 1,
  complete = function()
    return vim.tbl_keys(M.modes)
  end,
  desc = "Transparenz-Modus setzen",
})

-- :TransparencyCycle
vim.api.nvim_create_user_command("TransparencyCycle", function()
  M.cycle()
end, {
  desc = "Transparenz-Modus durchschalten",
})

-- :TransparencyInfo
vim.api.nvim_create_user_command("TransparencyInfo", function()
  M.info()
end, {
  desc = "Transparenz-Info anzeigen",
})

return M

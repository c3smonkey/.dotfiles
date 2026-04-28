vim.pack.add({
  'folke/which-key.nvim',
  'neovim/nvim-lspconfig',
  'nvim-lua/plenary.nvim',
})

-- ╭──────────────────────╮
-- │  User Commands       │
-- ╰──────────────────────╯

-- :PackUpdate - Plugins updaten
vim.api.nvim_create_user_command("PackUpdate", function()
  vim.pack.update()
end, {
  desc = "Plugins updaten (vim.pack)",
})

-- :PackInfo - Plugin Info anzeigen
vim.api.nvim_create_user_command("PackInfo", function()
  local plugins = vim.pack.get()
  local info = {}
  table.insert(info, "╭─────────────────────────────────────╮")
  table.insert(info, "│  Installierte Plugins (" .. #plugins .. ")          │")
  table.insert(info, "╰─────────────────────────────────────╯")
  table.insert(info, "")
  for _, plugin in ipairs(plugins) do
    local status = plugin.active and "✓ Aktiv" or "○ Nicht geladen"
    local rev = plugin.rev:sub(1, 7)
    table.insert(info, string.format("  %s  %s (%s)", status, plugin.spec.name, rev))
  end
  vim.notify(table.concat(info, "\n"), vim.log.levels.INFO)
end, {
  desc = "Installierte Plugins anzeigen",
})

-- :PackSync - Aus Lockfile synchronisieren
vim.api.nvim_create_user_command("PackSync", function()
  vim.pack.update(nil, { offline = true, target = 'lockfile' })
end, {
  desc = "Plugins mit Lockfile synchronisieren",
})

-- ╭──────────────────────╮
-- │  Konfigurationen     │
-- ╰──────────────────────╯
require("plugins.whichkey")

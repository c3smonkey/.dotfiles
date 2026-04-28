-- ╭─────────────────────────────────────────────────────────╮
-- │  which-key Setup                                        │
-- ╰─────────────────────────────────────────────────────────╯

local ok, which_key = pcall(require, "which-key")
if not ok then
  return
end

which_key.setup({
  preset = "classic",
  delay = 200,
  notify = false,
})

which_key.add({
  { "<leader>b", group = "Buffer" },
  { "<leader>bp", desc = "Vorheriger Buffer" },
  { "<leader>bn", desc = "Nächster Buffer" },
  { "<leader>bc", desc = "Buffer schließen" },
  { "<leader>bd", desc = "Buffer schließen" },
  { "<leader>bx", desc = "Unsplit" },
  { "<leader>-", desc = "Horizontal split" },
  { "<leader>|", desc = "Vertical split" },
  { "<leader>p", group = "Plugins" },
  { "<leader>pu", desc = "Plugins updaten" },
  { "<leader>ps", desc = "Lockfile sync" },
  { "<leader>pi", desc = "Plugin-Liste" },
  { "<leader>t", group = "Transparenz" },
  { "<leader>r", desc = "Resize-Mode umschalten" },
  { "<leader>e", desc = "Datei-Explorer (Toggle)" },
  { "<leader>w", desc = "Write" },
  { "<leader>q", desc = "Schließen" },
  { "<leader>Q", desc = "Alle schließen" },
  { "<Tab>", desc = "Vorheriger Tab" },
  { "<S-Tab>", desc = "Nächster Tab" },
})

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
  { "<leader>t", group = "Transparenz" },
  { "<leader>e", desc = "Datei-Explorer (Toggle)" },
  { "<leader>w", desc = "Speichern" },
  { "<leader>q", desc = "Schließen" },
  { "<leader>Q", desc = "Alle schließen" },
})

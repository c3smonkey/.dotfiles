-- ╭─────────────────────────────────────────────────────────╮
-- │  Neovim Keymaps                                         │
-- │  Nutzt vim.keymap.set() (Neovim 0.7+)                   │
-- ╰─────────────────────────────────────────────────────────╯

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local resize_mode = false

-- Helper für opts mit description
local function keymap_opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- ╭──────────────╮
-- │  Leader Key  │
-- ╰──────────────╯
-- Leader wird in core/options.lua gesetzt: vim.g.mapleader = " "

-- ╭──────────────────╮
-- │  Normal Mode (n) │
-- ╰──────────────────╯

-- Resize Mode (Leader + r zum Ein/Aus)
local function resize_mode_on()
  map("n", "h", ":vertical resize -2<CR>", keymap_opts("Resize links"))
  map("n", "j", ":resize +2<CR>", keymap_opts("Resize unten"))
  map("n", "k", ":resize -2<CR>", keymap_opts("Resize oben"))
  map("n", "l", ":vertical resize +2<CR>", keymap_opts("Resize rechts"))
  vim.notify("Resize-Mode: AN (h/j/k/l)", vim.log.levels.INFO)
end

local function resize_mode_off()
  pcall(vim.keymap.del, "n", "h")
  pcall(vim.keymap.del, "n", "j")
  pcall(vim.keymap.del, "n", "k")
  pcall(vim.keymap.del, "n", "l")
  vim.notify("Resize-Mode: AUS", vim.log.levels.INFO)
end

map("n", "<leader>r", function()
  resize_mode = not resize_mode
  if resize_mode then
    resize_mode_on()
  else
    resize_mode_off()
  end
end, keymap_opts("Resize-Mode umschalten"))

-- Tab Navigation
map("n", "<Tab>", ":tabprevious<CR>", keymap_opts("Vorheriger Tab"))
map("n", "<S-Tab>", ":tabnext<CR>", keymap_opts("Nächster Tab"))

-- Buffer Navigation
map("n", "<leader>bp", ":bprevious<CR>", keymap_opts("Vorheriger Buffer"))
map("n", "<leader>bn", ":bnext<CR>", keymap_opts("Nächster Buffer"))
map("n", "<leader>bd", ":bdelete<CR>", keymap_opts("Buffer schließen"))
map("n", "<leader>bc", ":bdelete<CR>", keymap_opts("Buffer schließen"))
map("n", "<leader>bx", ":only<CR>", keymap_opts("Unsplit (nur aktuelles Fenster)"))
map("n", "<leader>-", "<cmd>silent split<CR>", keymap_opts("Horizontal split"))
map("n", "<leader>|", "<cmd>silent vsplit<CR>", keymap_opts("Vertical split"))

-- Clear Search Highlights (ESC zum Löschen der Highlights)
map("n", "<Esc>", function()
  if resize_mode then
    resize_mode = false
    resize_mode_off()
    return
  end
  vim.cmd("nohlsearch")
end, keymap_opts("Search Highlight löschen / Resize-Mode aus"))

-- Besseres Speichern & Schließen
map("n", "<leader>w", ":write<CR>", keymap_opts("Speichern"))
map("n", "<leader>q", ":quit<CR>", keymap_opts("Schließen"))
map("n", "<leader>Q", ":quitall<CR>", keymap_opts("Alle schließen"))
map("n", "<leader>e", ":Lexplore<CR>", keymap_opts("Datei-Explorer (Toggle)"))

-- Zentral scrollen nach Suche
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Zeilen zusammenfügen ohne Cursor-Bewegung
map("n", "J", "mzJ`z", opts)

-- ╭──────────────────╮
-- │  Visual Mode (v) │
-- ╰──────────────────╯

-- Besseres Indenting (bleibt in Visual Mode)
map("v", "<", "<gv", keymap_opts("Indent links"))
map("v", ">", ">gv", keymap_opts("Indent rechts"))

-- Text verschieben
map("v", "J", ":move '>+1<CR>gv=gv", keymap_opts("Text runter"))
map("v", "K", ":move '<-2<CR>gv=gv", keymap_opts("Text hoch"))

-- Paste ohne Yank (nicht ins Register kopieren)
map("v", "p", '"_dP', opts)

-- ╭─────────────────╮
-- │  Insert Mode (i) │
-- ╰─────────────────╯

-- Schnell aus Insert Mode raus (jj und jk)
map("i", "jj", "<Esc>", keymap_opts("Exit Insert Mode"))
map("i", "jk", "<Esc>", keymap_opts("Exit Insert Mode"))
map("i", "kj", "<Esc>", keymap_opts("Exit Insert Mode"))

-- ╭──────────────────────╮
-- │  Colorscheme Keymaps │
-- ╰──────────────────────╯

-- Transparenz durchschalten
map("n", "<leader>tt", ":TransparencyCycle<CR>", keymap_opts("Transparenz durchschalten"))

-- Transparenz setzen
map("n", "<leader>tn", ":TransparencySet none<CR>", keymap_opts("Transparenz: Keine"))
map("n", "<leader>tm", ":TransparencySet minimal<CR>", keymap_opts("Transparenz: Minimal"))
map("n", "<leader>tr", ":TransparencySet moderate<CR>", keymap_opts("Transparenz: Moderat"))
map("n", "<leader>tf", ":TransparencySet full<CR>", keymap_opts("Transparenz: Maximal"))

-- Colorscheme wechseln (für Zukunft)
-- map("n", "<leader>cs", ":ColorschemeLoad<CR>", keymap_opts("Colorscheme auswählen"))

-- Plugin Management (Standard vim.pack)
map("n", "<leader>pu", function()
  vim.pack.update()
end, keymap_opts("Plugins updaten"))
map("n", "<leader>ps", function()
  vim.pack.update(nil, { offline = true, target = "lockfile" })
end, keymap_opts("Plugins aus Lockfile syncen"))
map("n", "<leader>pi", function()
  vim.print(vim.pack.get())
end, keymap_opts("Plugin-Liste anzeigen"))

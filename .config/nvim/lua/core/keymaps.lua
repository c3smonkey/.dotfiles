-- ╭─────────────────────────────────────────────────────────╮
-- │  Neovim Keymaps                                         │
-- │  Nutzt vim.keymap.set() (Neovim 0.7+)                   │
-- ╰─────────────────────────────────────────────────────────╯

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

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

-- Besseres Window Navigation
map("n", "<C-h>", "<C-w>h", keymap_opts("Fenster links"))
map("n", "<C-j>", "<C-w>j", keymap_opts("Fenster unten"))
map("n", "<C-k>", "<C-w>k", keymap_opts("Fenster oben"))
map("n", "<C-l>", "<C-w>l", keymap_opts("Fenster rechts"))

-- Window Resize
map("n", "<C-Up>", ":resize +2<CR>", keymap_opts("Fenster höher"))
map("n", "<C-Down>", ":resize -2<CR>", keymap_opts("Fenster niedriger"))
map("n", "<C-Left>", ":vertical resize -2<CR>", keymap_opts("Fenster schmaler"))
map("n", "<C-Right>", ":vertical resize +2<CR>", keymap_opts("Fenster breiter"))

-- Buffer Navigation
map("n", "<S-h>", ":bprevious<CR>", keymap_opts("Vorheriger Buffer"))
map("n", "<S-l>", ":bnext<CR>", keymap_opts("Nächster Buffer"))
map("n", "<leader>bd", ":bdelete<CR>", keymap_opts("Buffer schließen"))

-- Clear Search Highlights (ESC zum Löschen der Highlights)
map("n", "<Esc>", ":nohlsearch<CR>", keymap_opts("Search Highlight löschen"))

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

-- ╭──────────────────────╮
-- │  Plugin Management   │
-- ╰──────────────────────╯

map("n", "<leader>pu", ":PackUpdate<CR>", keymap_opts("Plugins updaten"))
map("n", "<leader>pi", ":PackInfo<CR>", keymap_opts("Plugin Info"))
map("n", "<leader>ps", ":PackSync<CR>", keymap_opts("Plugins synchronisieren"))

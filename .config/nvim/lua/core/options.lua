-- ╭─────────────────────────────────────────────────────────╮
-- │  Neovim Core Optionen                                   │
-- │  Nutzt native Neovim 0.12 APIs                          │
-- ╰─────────────────────────────────────────────────────────╯

local opt = vim.opt
local g = vim.g

-- Leader Keys (MUSS vor keymaps gesetzt werden)
g.mapleader = " "
g.maplocalleader = " "

-- ╭──────────────╮
-- │  UI & Editor │
-- ╰──────────────╯

-- Zeilennummern
opt.number = true                   -- Absolute Zeilennummern
opt.relativenumber = true           -- Relative Zeilennummern
opt.numberwidth = 4                 -- Breite der Nummern-Spalte

-- Cursor & Zeilen
opt.cursorline = true               -- Aktuelle Zeile highlighten
opt.scrolloff = 8                   -- Zeilen über/unter Cursor sichtbar
opt.sidescrolloff = 8               -- Spalten links/rechts vom Cursor
opt.wrap = false                    -- Keine Zeilen-Umbrechung

-- Signale & Gutter
opt.signcolumn = "yes"              -- Immer Sign Column anzeigen
opt.colorcolumn = ""                -- Keine color column (leer lassen)

-- UI Verbesserungen
opt.termguicolors = true            -- True Color Support (24-bit)
opt.showmode = false                -- Mode nicht anzeigen (für Statusline)
opt.cmdheight = 0                   -- Keine permanente Command-Zeile
opt.pumheight = 10                  -- Popup menu Höhe
opt.showtabline = 0                 -- Tabline ausblenden
opt.laststatus = 0                  -- Statusline ausblenden
opt.statusline = ""                 -- Keine Statusline-Inhalte
opt.winbar = ""                     -- Kein Fensterpfad oben im Split

-- ╭─────────────────╮
-- │  Tabs & Spaces  │
-- ╰─────────────────╯

opt.tabstop = 2                     -- Tab = 2 Spaces
opt.shiftwidth = 2                  -- Indent = 2 Spaces
opt.expandtab = true                -- Tabs zu Spaces konvertieren
opt.autoindent = true               -- Auto-Indent
opt.smartindent = true              -- Smart-Indent für Code

-- ╭─────────╮
-- │  Search │
-- ╰─────────╯

opt.hlsearch = true                 -- Suchergebnisse highlighten
opt.incsearch = true                -- Incremental Search
opt.ignorecase = true               -- Case-insensitive Search
opt.smartcase = true                -- Case-sensitive wenn Großbuchstaben

-- ╭───────────╮
-- │  Behavior │
-- ╰───────────╯

-- Splits
opt.splitright = true               -- Vertical split rechts öffnen
opt.splitbelow = true               -- Horizontal split unten öffnen

-- Clipboard
opt.clipboard = "unnamedplus"       -- System Clipboard nutzen

-- Undo & Backup
opt.undofile = true                 -- Persistent Undo
opt.swapfile = false                -- Keine Swap-Dateien
opt.backup = false                  -- Keine Backup-Dateien
opt.writebackup = false             -- Kein Backup beim Schreiben

-- Timing
opt.updatetime = 250                -- Schnellere Completion (CursorHold)
opt.timeoutlen = 300                -- Schnelleres Key Timeout

-- Completion
opt.completeopt = "menu,menuone,noselect"  -- Completion Optionen
opt.shortmess:append("F")          -- Keine Dateiname-Meldung bei Splits

-- Mouse
opt.mouse = "a"                     -- Mouse Support in allen Modi

-- Performance
opt.lazyredraw = false              -- Kein lazy redraw (kann flackern)
opt.ttyfast = true                  -- Schnelles Terminal

-- Folding (Neovim 0.10+)
opt.foldmethod = "expr"             -- Treesitter-basiertes Folding
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = false              -- Folds standardmäßig offen
opt.foldlevel = 99                  -- Hoher Foldlevel

-- ╭──────────╮
-- │  Neovim  │
-- ╰──────────╯

-- Netrw File-Explorer (VS Code-ähnliche Sidebar)
g.netrw_winsize = 20               -- Schmale Sidebar (in %)
g.netrw_banner = 0                 -- Kein Banner
g.netrw_liststyle = 3              -- Tree-Ansicht
g.netrw_browse_split = 4           -- Datei im vorherigen Fenster öffnen

-- Disable Netrw (wenn File Explorer Plugin genutzt wird)
-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1

-- Disable einige built-in Plugins für Performance
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

-- ╭─────────────────────╮
-- │  Auto Commands      │
-- ╰─────────────────────╯

-- Highlight beim Kopieren (Yank)
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight beim Kopieren",
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})

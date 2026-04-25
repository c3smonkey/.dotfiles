# Neovim Configuration

Moderne, minimalistische Neovim-Konfiguration mit transparentem Hintergrund und mächtigen Workflow-Tools.

## 📁 Struktur

```
~/.config/nvim/
├── init.lua                # Hauptkonfiguration
├── lua/
│   ├── colorscheme.lua    # 6 Farbpaletten + Transparenz
│   └── keymaps.lua        # Alle Keybindings
└── README.md              # Diese Datei
```

## ⚙️ Features

- 🎨 **6 Farbpaletten** - mini.hues mit azure, blue, forest, purple, sunset, gray
- 🔍 **Fuzzy Finding** - Schnelle Datei- und Textsuche (mini.pick)
- 📁 **File Explorer** - Vim-artiger File Browser mit Edit-Mode (mini.files)
- 💎 **Transparenz** - Durchsichtiger Hintergrund für WezTerm
- ⚡ **Schnell** - Minimale Plugins, schneller Start
- 🔧 **Modular** - Saubere Trennung: Config, Keymaps, Colorscheme

## ⌨️ Keymaps

**Leader Key**: `Space`

### Core

| Keymap | Action |
|--------|--------|
| `jj` | Exit Insert Mode (statt Esc) |
| `Esc` | Clear search highlighting |
| `Space w` | Save file |
| `Space q` | Quit |
| `Space x` | Save and quit |

### Fuzzy Finder (Mini.pick)

| Keymap | Action |
|--------|--------|
| `Space sf` | Find files |
| `Space sg` | Live grep (search in files) |
| `Space sb` | Find buffers |

**Im Picker**: `Ctrl-n/p` (navigate), `Tab` (preview), `Enter` (open), `Esc` (close)

### File Explorer (Mini.files)

| Keymap | Action |
|--------|--------|
| `Space wn` | Open file explorer |

**Im Explorer**:
- `j/k` - Navigate up/down
- `l` - Open folder / Open file
- `h` - Go back
- `q` - Close explorer

**Edit Mode** (press `i`):
- New line = Create file
- Edit line = Rename file
- `dd` = Delete file
- `folder/` = Create folder (with trailing /)
- `=` = Save changes to disk
- `<BS>` = Discard changes

### Yazi File Manager

| Keymap | Action |
|--------|--------|
| `Space ee` | Open Yazi (floating window) |

**In Yazi**:
- `j/k` - Navigate up/down
- `l` or `Enter` - Open folder/file
- `h` - Go back
- `q` - Close Yazi
- `Tab` - Cycle open buffers
- `Ctrl-v` - Open in vertical split
- `Ctrl-x` - Open in horizontal split
- `Ctrl-t` - Open in new tab
- `F1` - Show help

### Window Navigation

| Keymap | Action |
|--------|--------|
| `Ctrl h` | Move to left window |
| `Ctrl j` | Move to bottom window |
| `Ctrl k` | Move to top window |
| `Ctrl l` | Move to right window |

### Visual Mode

| Keymap | Action |
|--------|--------|
| `<` | Indent left (keep selection) |
| `>` | Indent right (keep selection) |

## 🎨 Colorscheme

**mini.hues** mit 6 vorkonfigurierten Farbpaletten:

| Preset | Style | Background |
|--------|-------|------------|
| `azure` | Icy winter | `#11262d` (Cyan/Blue) |
| `blue` ⭐ | Classic (active) | `#19213a` (Deep Blue) |
| `forest` | Natural green | `#17280e` (Forest) |
| `purple` | Mystic | `#2b1a33` (Purple) |
| `sunset` | Warm orange | `#361a0d` (Brown) |
| `gray` | Monochrome | `#1a1a1a` (Gray) |

**Preset wechseln**: 
Bearbeite `lua/colorscheme.lua` Zeile 46:
```lua
local active_preset = 'blue'  -- Ändere zu: 'forest', 'purple', etc.
```

**Transparenz**: Voll transparent + WezTerm Opacity (95%)

## 📂 File Explorer Quick Guide

### Datei öffnen
```vim
Space wn    " Open explorer
j/k         " Navigate to file
l           " Open file
```

### Ordner navigieren
```vim
Space wn    " Open explorer
j/k         " Navigate to folder (shows '/')
l           " Enter folder
h           " Go back
```

### Dateien erstellen/umbenennen/löschen
```vim
Space wn         " Open explorer
i                " Enter edit mode
new-file.txt     " Add new line = create file
[edit name]      " Edit line = rename file
dd               " Delete line = delete file
Esc              " Exit edit mode
=                " Save changes to disk
```

### Ordner erstellen
```vim
Space wn
i
new-folder/      " Add line with trailing /
Esc
=
```

## 🚀 Quick Start

```vim
# Datei finden
Space sf         " Fuzzy file finder
[type name]
Enter

# Text in Dateien suchen
Space sg         " Live grep
[type search]
Enter

# File Explorer
Space wn         " Open explorer
l                " Open folder/file
h                " Go back

# Insert Mode verlassen
i                " Enter insert mode
[type text]
jj               " Back to normal mode (instead of Esc)

# Speichern & Beenden
Space w          " Save
Space q          " Quit
```

## 🔧 Config Management

### Config neu laden

```vim
:source $MYVIMRC
```

Oder kürzer:
```vim
:source ~/.config/nvim/init.lua
```

### Config-Datei öffnen

```vim
:e $MYVIMRC
```

### Neovim neu starten

```vim
:restart
```

### Plugins installieren/updaten

Nach Hinzufügen eines neuen Plugins in `init.lua`:

```vim
:source $MYVIMRC
:lua vim.pack.update()
```

Oder beim nächsten Start werden Plugins automatisch installiert.

### Plugin hinzufügen

1. Bearbeite `init.lua` (Zeilen 17-20):
   ```lua
   vim.pack.add({
     'https://github.com/neovim/nvim-lspconfig',
     'https://github.com/nvim-mini/mini.nvim',
     'https://github.com/USER/NEW-PLUGIN',  -- NEU
   })
   ```

2. Reload und installieren:
   ```vim
   :source $MYVIMRC | lua vim.pack.update()
   ```

### Einzelne Module neu laden

```vim
:lua package.loaded['keymaps'] = nil | require('keymaps')
:lua package.loaded['colorscheme'] = nil | require('colorscheme')
```

## 📦 Installation

### Voraussetzungen

- Neovim >= 0.10
- Git
- Terminal mit Transparenz-Support (WezTerm, iTerm2, Alacritty, Kitty)

### Setup

```bash
# Backup existierender Config
mv ~/.config/nvim ~/.config/nvim.backup

# Diese Config installieren
git clone [YOUR-REPO-URL] ~/.config/nvim

# Neovim starten - Plugins werden automatisch installiert
nvim
```

## 💡 Tipps

**Navigation in Config-Dateien**:
```vim
" In init.lua, Cursor auf require() setzen:
require('keymaps')     " Dann 'gf' drücken → springt zu lua/keymaps.lua
                       " Ctrl-o → zurück
```

**Schnellsuche mit mini.pick**:
```vim
Space sf        " File Finder
init            " Tippe nur Teil des Namens
                " Fuzzy matching findet automatisch
```

**Batch-Rename mit mini.files**:
```vim
Space wn
i
" Bearbeite mehrere Zeilen gleichzeitig:
old1.txt → new1.txt
old2.txt → new2.txt
Esc
=               " Alle gleichzeitig umbenennen!
```

**Working Directory in Explorer anzeigen**:
```vim
Space wn
@               " Zeigt aktuelles Working Directory
```

## 🎯 Workflow-Beispiele

### Code-Review

```vim
1. Space sf           " Finde Datei
2. [filename]         " Tippe Name
3. Enter              " Öffnen
4. /searchterm        " Suchen
5. n/N                " Durch Ergebnisse
6. Esc                " Highlighting weg
```

### Projekt-Struktur erkunden

```vim
1. Space wn           " Explorer öffnen
2. l l l              " Tief in Struktur navigieren
3. H                  " Zurück zum Root
4. @                  " Working Dir checken
```

### Schnelles Editieren

```vim
1. Space sf           " Datei finden
2. Enter              " Öffnen
3. i                  " Insert Mode
4. [changes]          " Änderungen
5. jj                 " Normal Mode (statt Esc)
6. Space w            " Speichern
```

## 🔍 Plugins

**Core**:
- [mini.nvim](https://github.com/echasnovski/mini.nvim) - Swiss Army Knife für Neovim
  - mini.basics - Sinnvolle Defaults
  - mini.hues - Colorscheme
  - mini.pick - Fuzzy Finder
  - mini.files - File Explorer
  - mini.surround - Surround-Operationen
  - mini.comment - Smart Commenting
  - mini.pairs - Auto-Pairs
  - mini.tabline - Buffer/Tab-Leiste
  - mini.statusline - Statusline

**File Management**:
- [yazi.nvim](https://github.com/mikavilpas/yazi.nvim) - Yazi File Manager Integration
  - Floating window mit rounded borders
  - Schnelle Navigation und File-Operations
  - Image Preview Support (wenn yazi installiert)

**LSP** (ready to configure):
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP Configuration

## 🐛 Troubleshooting

**Transparenz funktioniert nicht**:
- Prüfe Terminal-Transparenz-Einstellungen (WezTerm, iTerm2, etc.)
- Neovim neu starten: `:restart`

**mini.files findet keine Dateien**:
- Bist du im richtigen Verzeichnis? Check mit `@` im Explorer
- Working Directory ändern: `:cd /path/to/project`

**Plugin-Fehler nach Update**:
- Config neu laden: `:source $MYVIMRC`
- Plugins neu installieren: `:lua vim.pack.update()`

**Config-Änderungen wirken nicht**:
- Modul-Cache leeren: `:lua package.loaded['modulename'] = nil`
- Oder Neovim neu starten: `:restart`

## 📚 Weitere Ressourcen

- [mini.nvim Dokumentation](https://github.com/echasnovski/mini.nvim)
- [Neovim Documentation](https://neovim.io/doc/)
- [WezTerm Docs](https://wezfurlong.org/wezterm/)

---

**Version**: 2.0  
**Neovim**: >= 0.10  
**Updated**: 2026-04-24  
**Status**: ✅ Production Ready

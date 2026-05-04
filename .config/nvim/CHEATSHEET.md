# Neovim Daily Keys

## Kotlin Spring Boot

### Run & Build:
- `,rr`: run Spring Boot (auto-detect Gradle/Maven)
- `,R`: run with module selection (multi-module projects)
- `,rs`: stop running Spring Boot app
- `,c`: compile project (Gradle/Maven)
- `,f`: format buffer
- `,i`: organize imports

### Testing:
- `,t`: run test method under cursor (fast - skip compile)
- `,T`: run entire test class (fast - skip compile)
- `,rf`: rerun last test

**Workflow:** Edit code → `,c` (compile) → `,T` (test fast) → `,T` (rerun fast)  
**Note:** Tests reuse same terminal window. Close with `:q` in normal mode.

### In Terminal Window:
- `Ctrl-C`: stop Spring Boot app / stop test
- `q`: close terminal window (normal mode)
- `i`: enter insert mode to interact with terminal

## File Explorer (mini.files)

- `<leader>e`: open mini.files explorer (fast, no preview by default)
- `<leader>ee`: open Yazi file manager (full-featured)

### Navigation in mini.files (default keymaps):
- `j` / `k`: move up/down in list
- `-`: go to parent directory ⬆️
- `H`: go to parent directory (stay on entry)
- `Enter`: open file / enter directory ⬇️
- `h` / `l`: move between columns (Vim-style)
- `p`: toggle preview ON/OFF 🔄
- `q`: close explorer
- `g?`: show help with all keymaps
- `<BS>`: reset to initial directory
- `@`: reveal current working directory
- `m`: set mark
- `'`: goto mark
- `=`: synchronize filesystem changes

## Search

- `<leader>sf`: search files (ripgrep)
- `<leader>sg`: search by grep (live)
- `<leader>sb`: search buffers
- `<leader>sr`: search recent files (project only, max 10)
- `<leader>sk`: search keymaps 🆕
- `<leader>sc`: search commands 🆕
- `<leader>sR`: search registers (yank history) 🆕
- `<leader>sw`: search word under cursor in project 🆕

## LSP & Code Actions

- `grr`: references
- `gra`: code action
- `grn`: rename symbol
- `gd` / `gi` / `gt`: definition / implementation / type definition
- `ge` / `gE`: next / previous diagnostic
- `,f`: format buffer
- `,i`: organize imports
- `,se`: show line diagnostics

## Copilot

- `<Tab>` (insert): accept Copilot if visible, else normal tab
- `⌥l` (`<M-l>`): accept Copilot
- `⌥]` / `⌥[` (`<M-]>` / `<M-[>`): next / previous Copilot suggestion
- `<leader>cc`: toggle Copilot Chat

## rebase -i

- Block mode (ohne Regex)
  - `Ctrl+v` block markieren
  - `c` = change (markierten Block ersetzen)
  - Beispiel: `pick`-Block markieren -> `c` -> `f` -> `Esc`

- Regex (ganze Datei)
  - `:%s/^pick /f /g`
  - mit Bestätigung je Treffer: `:%s/^pick /f /gc`

## Release / Push

- Nach Rebase sicher pushen: `git push --force-with-lease`
- Für Release-Branch: `git push --force-with-lease origin release`
- Kein blindes `--force` nutzen
- Vor Push kurz prüfen: `git status` und `git log --oneline --decorate -n 10`

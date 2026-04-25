# Neovim Daily Keys

- `grr`: references
- `gra`: code action
- `grn`: rename symbol
- `gd` / `gi` / `gt`: definition / implementation / type definition
- `ge` / `gE`: next / previous diagnostic
- `,f`: format buffer
- `,i`: organize imports
- `<Tab>` (insert): accept Copilot if visible, else normal tab
- `⌥l` (`<M-l>`): accept Copilot
- `⌥]` / `⌥[` (`<M-]>` / `<M-[>`): next / previous Copilot suggestion

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

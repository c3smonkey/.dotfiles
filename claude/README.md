# Claude Code

Zentrale Einstellungen für Claude Code auf jedem Mac.

```bash
~/.dotfiles/claude/setup.sh
```

- `settings.json`, `CLAUDE.md`, `plugins/claude-vitals/config.json` werden nach `~/.claude/` verlinkt.
  Beim ersten Lauf übernimmt das Skript vorhandene Dateien aus `~/.claude/` in diesen Ordner (Backup bleibt liegen).
- `plugins.txt`: lokal installierte Plugins. Superpowers, Excalidraw und claude-vitals kommen über das claude.ai-Konto.
- Neues Plugin: Zeile in `plugins.txt` ergänzen, `setup.sh` erneut ausführen.
- Keine Secrets hier ablegen (`settings.json` vor dem Commit prüfen).

## Skills, Agents, Commands → ai-os
Die liegen nicht mehr hier, sondern zentral in ai-os (`~/git/ai-c3smonkey/ai-os/ai/`).
`setup.sh` verlinkt `~/.claude/agents` und `~/.claude/commands` dorthin und ruft `ai-link --global` auf,
das die Skills aus `ai/global.txt` einzeln nach `~/.claude/skills/` verlinkt.
Projekt-Skills: `.claude/skills.txt` im Repo, dann `ai-link`. Details: README in `ai-os/ai/`.

## Nicht in den Dotfiles (gehört nicht hierher)
- Anmeldedaten: `~/.notebooklm/` (`notebooklm login` pro Mac), Claude-Login, API-Keys.
- `~/.claude/plugins/cache`, Verlauf und Sitzungen: erzeugt Claude Code selbst.

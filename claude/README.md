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

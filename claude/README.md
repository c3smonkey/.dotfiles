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

## Skills und Agents → ai-os
Die liegen nicht hier, sondern zentral in ai-os (`~/git/ai-c3smonkey/ai-os/ai/`).
`setup.sh` ruft `ai-link --global` auf: verlinkt `ai/global.txt` (Skills) und `ai/global-agents.txt` (Agents)
einzeln nach `~/.claude/skills/` bzw. `~/.claude/agents/`.
Pro Repo: `.claude/skills.txt` und `.claude/agents.txt`, dann `ai-link`. Details: `ai-os/ai/README.md`.

## Nicht in den Dotfiles (gehört nicht hierher)
- Anmeldedaten: `~/.notebooklm/` (`notebooklm login` pro Mac), Claude-Login, API-Keys.
- `~/.claude/plugins/cache`, Verlauf und Sitzungen: erzeugt Claude Code selbst.

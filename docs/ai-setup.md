# AI-Setup lokal (Ollama + Qdrant + Claude Code)

Ziel: Claude-Tokens sparen. Suche und Fleissarbeit laufen lokal, Denkarbeit macht Claude Code.
Schnellübersicht im Terminal: `aihelp`

## Tools (`~/.dotfiles/bin`)

| Tool | Alias | Zweck |
|---|---|---|
| `git-ai-init` | `aiinit` / `git ai-init` | Repo einrichten: post-commit-Hook, erste Indexierung, Checks. `--claude` ergänzt Regeln in der `CLAUDE.md`, `--global` richtet nur die Hook-Vorlage ein |
| `repo-rag` | `rr`, `rri`, `rrs` | Repo in Qdrant indexieren und semantisch suchen (`rr "fetch open positions from bingx"`) |
| `ask-local` | `al`, `ald` | Frage oder Pipe an das lokale Modell. Standard `deepseek-coder-v2:16b`, `--deep` = `qwen2.5-coder:14b` |
| `bench-local` | `aibench` | Lokale Modelle mit echten Repo-Aufgaben messen (Tempo + Antworten zur Qualitätsprüfung) |

Hook-Vorlage: `~/.dotfiles/git-template/hooks/post-commit` (über `init.templateDir`). Jeder neue Klon
aktualisiert den Index damit nach jedem Commit automatisch.

## Neuer Mac

```bash
brew install ollama && brew services start ollama
ollama pull deepseek-coder-v2:16b
ollama pull qwen2.5-coder:14b
ollama pull nomic-embed-text
docker run -d --name qdrant --restart unless-stopped -p 6333:6333 -p 6334:6334 -v ~/qdrant_storage:/qdrant/storage qdrant/qdrant
git ai-init --global
```

Docker Desktop: „Start when you sign in“ aktivieren. `~/.dotfiles/bin` ist über die `.zshrc` im PATH.

## Neues Repo

```bash
cd <repo>
git ai-init --claude
```

## Regeln, die sich bewährt haben

- `ask-local` nur für **eine** Quelle (Log, Diff, Fixture, Commit-Message), nicht für Vergleiche oder Status-Fragen.
- Lokale Antworten sind Entwürfe: präzise Dinge prüfen.
- Claude Code: `/clear` nach jedem Commit, nach über 1 h Pause neu starten, Subagenten neu starten statt resumen.
- Messung (Go-Migration, Okt. 2026): mit diesen Regeln etwa +1 % Wochen-Limit pro Phase statt +3 %.

Ausführliche Doku mit Messwerten: `docs/local-ai-setup.md` im Repo `monkey-trader/trading-intelligence-platform`.

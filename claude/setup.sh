#!/usr/bin/env bash
# Claude-Code-Setup aus den Dotfiles: verlinkt Einstellungen nach ~/.claude
# und installiert die Plugins aus plugins.txt. Mehrfach ausführbar.
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DST="$HOME/.claude"
mkdir -p "$DST/plugins/claude-vitals"

# Datei aus den Dotfiles nach ~/.claude verlinken.
# Gibt es sie nur in ~/.claude, wird sie zuerst in die Dotfiles übernommen.
link() {
  local rel="$1" src="$SRC/$1" dst="$DST/$1"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "ok      $rel"; return
  fi
  if [ ! -e "$src" ] && [ -f "$dst" ]; then
    cp "$dst" "$src"; echo "übernommen $rel → Dotfiles"
  fi
  [ -e "$src" ] || { echo "fehlt   $rel (übersprungen)"; return; }
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mv "$dst" "$dst.bak.$(date +%Y%m%d%H%M%S)"; echo "Backup  $rel"
  fi
  ln -sfn "$src" "$dst"; echo "verlinkt $rel"
}

# Skills, Agents, Commands kommen aus ai-os (zentrale AI-Bibliothek).
AI_OS="${AI_OS:-$HOME/git/ai-c3smonkey/ai-os}"

link settings.json
link CLAUDE.md
link plugins/claude-vitals/config.json

if [ -d "$AI_OS/ai" ]; then
  # Skills und Agents einzeln verlinken (ai/global.txt, ai/global-agents.txt).
  # ~/.claude/skills und ~/.claude/agents bleiben echte Ordner: Claude Code schreibt dort selbst
  # (synced/ aus dem claude.ai-Konto), und Projekt-Agents kommen pro Repo über .claude/agents.txt.
  "$AI_OS/ai/bin/ai-link" --global
  # Alter Ganz-Ordner-Link aus früheren Versionen
  if [ -L "$DST/commands" ]; then rm "$DST/commands"; echo "entfernt commands/-Link (commands sind jetzt Skills)"; fi
else
  echo "ai-os fehlt ($AI_OS): git clone git@github.com:ai-c3smonkey/ai-os.git $AI_OS"
fi

# Plugins installieren (bereits installierte werden übersprungen)
if command -v claude >/dev/null; then
  installed="$(claude plugin list 2>/dev/null || true)"
  while read -r line; do
    case "$line" in ''|'#'*) continue ;; esac
    if [[ "$line" == marketplace\ * ]]; then
      claude plugin marketplace add "${line#marketplace }" >/dev/null 2>&1 || true
    elif grep -q "$line" <<<"$installed"; then
      echo "ok      Plugin $line"
    else
      claude plugin install "$line" && echo "installiert $line"
    fi
  done < "$SRC/plugins.txt"
else
  echo "claude nicht gefunden: Plugins übersprungen"
fi
# CLIs, die Skills brauchen
if command -v brew >/dev/null; then
  command -v backlog >/dev/null || brew install backlog-md
  echo "ok      backlog (Backlog.md, Skill development/backlog)"
fi
if command -v uv >/dev/null; then
  command -v notebooklm >/dev/null || uv tool install "notebooklm-py[browser]"
  echo "ok      notebooklm-CLI (Anmeldung einmal selbst: notebooklm login)"
else
  echo "uv fehlt: brew install uv, dann setup.sh erneut"
fi
echo "Fertig. Claude Code neu starten."

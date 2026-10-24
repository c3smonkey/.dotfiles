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

# Ordner nach ~/.claude verlinken. Ein vorhandener echter Ordner wird übernommen (Backup bleibt liegen).
link_dir() {
  local rel="$1" src="$2" dst="$DST/$1"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "ok      $rel/"; return
  fi
  if [ -d "$dst" ] && [ ! -L "$dst" ]; then
    cp -Rn "$dst/." "$src/" 2>/dev/null || true
    mv "$dst" "$dst.bak.$(date +%Y%m%d%H%M%S)"; echo "übernommen $rel/ → ai-os (Backup angelegt)"
  fi
  ln -sfn "$src" "$dst"; echo "verlinkt $rel/"
}

link settings.json
link CLAUDE.md
link plugins/claude-vitals/config.json

if [ -d "$AI_OS/ai" ]; then
  link_dir agents "$AI_OS/ai/agents"
  link_dir commands "$AI_OS/ai/commands"
  # Skills einzeln verlinken (ai/global.txt). ~/.claude/skills bleibt ein echter Ordner,
  # weil Claude Code dort selbst schreibt (synced/ aus dem claude.ai-Konto).
  "$AI_OS/ai/bin/ai-link" --global
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
if command -v uv >/dev/null; then
  command -v notebooklm >/dev/null || uv tool install "notebooklm-py[browser]"
  echo "ok      notebooklm-CLI (Anmeldung einmal selbst: notebooklm login)"
else
  echo "uv fehlt: brew install uv, dann setup.sh erneut"
fi
echo "Fertig. Claude Code neu starten."

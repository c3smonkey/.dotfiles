# =========================
# CONFIG
# =========================

# Basis Pfad zu llama.cpp binaries
LLM_HOME="$HOME/.local/llama.cpp/build/bin"

# Modell (gguf file)
LLM_MODEL="$HOME/models/mistral.gguf"

# Server Port
LLM_PORT=6969

# Server URL
LLM_URL="http://localhost:$LLM_PORT"


# =========================
# HELPERS (intern, nicht direkt nutzen)
# =========================

# Pfad zu llama-cli binary
_llm_cli() { echo "$LLM_HOME/llama-cli"; }

# Pfad zu llama-server binary
_llm_server() { echo "$LLM_HOME/llama-server"; }

# prüft ob API Server läuft
_llm_running() {
  curl -s "$LLM_URL" >/dev/null 2>&1
}

# startet Server falls nötig
_llm_start() {
  local server=$(_llm_server)

  "$server" -m "$LLM_MODEL" --port $LLM_PORT >/dev/null 2>&1 &

  # warten bis Server ready
  for i in {1..40}; do
    sleep 0.2
    if _llm_running; then
      return
    fi
  done

  echo "LLM server failed to start"
}


# =========================
# llm-chat → CHAT MODE
# =========================
# Nutzung:
#   llm-chat
#   llm-chat "frage"
#
# Verhalten:
#   - interaktiver REPL
#   - mit UI / Banner
#   - bleibt offen

llm-chat() {
  "$(_llm_cli)" -m "$LLM_MODEL" -cnv
}


# =========================
# llm-ask → ONE SHOT (CLI)
# =========================
# Nutzung:
#   llm-ask "frage"
#
# Verhalten:
#   - eine Antwort
#   - danach Exit
#   - kein Banner / kein raw token output

llm-ask() {
  "$(_llm_cli)" -m "$LLM_MODEL" \
    --chat-template mistral \
    -p "[INST] $* [/INST]" \
    -n 256 --no-display-prompt
}


# =========================
# llm-api → CLEAN CLI (API MODE)
# =========================
# Nutzung:
#   llm-api "frage"
#
# Verhalten:
#   - startet Server automatisch (falls nicht läuft)
#   - KEIN Banner
#   - KEIN Prompt
#   - nur reine Antwort
#   - nutzt JSON API

llm-api() {
  local server="$(_llm_server)"
  local url="$LLM_URL"

  # server starten falls nicht läuft
  if ! _llm_running; then
    _llm_start
  fi

  # request + robust parsing (content kann string oder array sein)
  curl -s "$url/completion" \
    -H "Content-Type: application/json" \
    -d "{\"prompt\":\"[INST] $* [/INST]\",\"n_predict\":128}" \
  | jq -r 'if .content | type == "string" then .content
           elif .content | type == "array" then .content[0].text
           else .completion end'
}


# =========================
# llm-spell-de / llm-spell-en → TEXT KORREKTUR TOOL
# =========================
# Nutzung:
#   llm-spell-de "text eingabe"
#   llm-spell-en "text input"
#
# Beispiele:
#   llm-spell-de "ich habe ein haus es ist gross"
#   llm-spell-en "text, foo bar? that is wrong right?"
#
# Verhalten:
#   - korrigiert Grammatik, Rechtschreibung, Zeichensetzung
#   - erhält Bedeutung
#   - KEINE Erklärung im Output
#   - funktioniert mit allen Zeichen (.,?!" etc.)
#   - nutzt API (kein Banner)
#   - llm-spell-de: antwortet auf Deutsch
#   - llm-spell-en: antwortet auf Englisch

# Generic Helper: übernimmt Server-Start, Payload und Request
_llm_completion() {
  local system="$1"
  local usr="$2"
  local n_predict="${3:-256}"
  local temperature="${4:-0.3}"
  local stop="${5:-null}"
  local url="$LLM_URL"

  # sicherstellen dass server läuft
  if ! _llm_running; then
    _llm_start
  fi

  # JSON sicher zusammenbauen (wichtig für Sonderzeichen)
  local payload=$(jq -n \
    --arg sys "$system" \
    --arg usr "$usr" \
    --argjson np "$n_predict" \
    --argjson temp "$temperature" \
    --argjson stop "$stop" \
    '{
      prompt: "[INST] \($sys)\n\nText:\n\($usr) [/INST]",
      n_predict: $np,
      temperature: $temp,
      stop: $stop
    }')

  # Request senden + robust Ausgabe lesen
  curl -s "$url/completion" \
    -H "Content-Type: application/json" \
    -d "$payload" \
  | jq -r '.completion // .content'
}

# Spell-Helper: fester Lektor-Modus
_llm_spell() {
  _llm_completion "$1" "$2" 256 0.2
}

llm-spell-de() {
  # fixer System Prompt (Tool Definition)
  local SYSTEM="Du bist ein deutscher Lektor.
Korrigiere Grammatik, Rechtschreibung und Zeichensetzung.
Erhalte die ursprüngliche Bedeutung.
Antworte immer auf Deutsch.
Gib nur den korrigierten Text zurück, ohne Erklärung."

  _llm_spell "$SYSTEM" "$*"
}

llm-spell-en() {
  # fixer System Prompt (Tool Definition)
  local SYSTEM="You are an English editor.
Correct grammar, spelling and punctuation.
Keep the original meaning.
Always respond in English.
Return only the corrected text, without explanation."

  _llm_spell "$SYSTEM" "$*"
}


# =========================
# llm-commit → CONVENTIONAL COMMIT MESSAGE
# =========================
# Nutzung:
#   llm-commit        # zeigt Commit-Message für aktuelle Changes
#   llm-commit -c     # erstellt Commit direkt
#
# Verhalten:
#   - analysiert git diff (staged, sonst alle uncommitted changes)
#   - erzeugt Conventional-Commits + semver Hinweis
#   - nur Message als Output
#   - nutzt API (kein Banner)

llm-commit() {
  local do_commit=0
  if [[ "$1" == "-c" || "$1" == "--commit" ]]; then
    do_commit=1
    shift
  fi

  # staged diff bevorzugen, sonst alle uncommitted changes
  local diff
  if ! git diff --cached --quiet 2>/dev/null; then
    diff="$(git diff --cached)"
  elif ! git diff --quiet 2>/dev/null; then
    diff="$(git diff)"
  else
    echo "Keine Änderungen gefunden" >&2
    return 1
  fi

  # Diff kappen falls riesig
  if (( ${#diff} > 8000 )); then
    diff="${diff:0:8000}\n... (gekürzt)"
  fi

  local SYSTEM="Du bist ein Git-Experte. Analysiere den folgenden Git-Diff und erstelle genau EINE Conventional-Commits-Nachricht.
Format: <type>(<scope>): <subject> - genau eine Zeile, kleingeschrieben, Englisch, Imperativ.
type: feat, fix, refactor, perf, docs, test, chore, build, ci, style.
scope: betroffener Bereich, z.B. llm, git, zsh (optional).
Breaking change: type mit ! kennzeichnen, z.B. feat(api)!: ...
Beispiel: refactor(llm): rename functions for clarity and add spell-checking capabilities
NUR die Commit-Nachricht ausgeben - kein Markdown, kein Code, keine Erklärung, kein Punkt am Ende."

  local msg
  msg="$(_llm_completion "$SYSTEM" "$diff" 100 0.3 '["\n"]')"

  # führende Whitespaces entfernen
  msg="${msg#"${msg%%[![:space:]]*}"}"

  echo "$msg"

  # Message in die Zwischenablage kopieren
  print -r -- "$msg" | pbcopy
  echo "✅ Commit-Message kopiert (pbcopy)"

  if (( do_commit )); then
    git commit -m "$msg"
  fi
}


# =========================
# llm-status → DEBUG / INFO
# =========================
# Nutzung:
#   llm-status
#
# zeigt:
#   - Modell Pfad
#   - Port
#   - ob Server läuft

llm-status() {
  echo "=== LLM STATUS ==="
  echo "Model: $LLM_MODEL"
  echo "Port: $LLM_PORT"
  echo ""

  if _llm_running; then
    echo "Server: RUNNING ✅"
    pgrep -fl llama-server
  else
    echo "Server: STOPPED ❌"
  fi
}


# =========================
# llm-stop → SERVER STOP
# =========================
# Nutzung:
#   llm-stop
#
# stoppt laufenden server

llm-stop() {
  pkill -f llama-server
}

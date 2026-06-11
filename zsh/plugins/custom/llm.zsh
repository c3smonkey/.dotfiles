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
# llm → CHAT MODE
# =========================
# Nutzung:
#   llm
#   llm "frage"
#
# Verhalten:
#   - interaktiver REPL
#   - mit UI / Banner
#   - bleibt offen

llm() {
  "$(_llm_cli)" -m "$LLM_MODEL" -cnv
}


# =========================
# llm1 → ONE SHOT (CLI)
# =========================
# Nutzung:
#   llm1 "frage"
#
# Verhalten:
#   - eine Antwort
#   - danach Exit
#   - kein Banner / kein raw token output

llm1() {
  "$(_llm_cli)" -m "$LLM_MODEL" \
    --chat-template mistral \
    -p "[INST] $* [/INST]" \
    -n 256 --no-display-prompt
}


# =========================
# llm2 → CLEAN CLI (API MODE)
# =========================
# Nutzung:
#   llm2 "frage"
#
# Verhalten:
#   - startet Server automatisch (falls nicht läuft)
#   - KEIN Banner
#   - KEIN Prompt
#   - nur reine Antwort
#   - nutzt JSON API

llm2() {
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
# llm3 → TEXT KORREKTUR TOOL
# =========================
# Nutzung:
#   llm3 "text eingabe"
#
# Beispiele:
#   llm3 "ich habe ein haus es ist gross"
#   llm3 "text, foo bar? das ist falsch oder?"
#
# Verhalten:
#   - korrigiert Grammatik, Rechtschreibung, Zeichensetzung
#   - erhält Bedeutung
#   - KEINE Erklärung im Output
#   - funktioniert mit allen Zeichen (.,?!" etc.)
#   - nutzt API (kein Banner)

llm3() {
  local url="$LLM_URL"

  # sicherstellen dass server läuft
  if ! _llm_running; then
    _llm_start
  fi

  # fixer System Prompt (Tool Definition)
  local SYSTEM="Du bist ein deutscher Lektor.
Korrigiere Grammatik, Rechtschreibung und Zeichensetzung.
Erhalte die ursprüngliche Bedeutung.
Antworte immer auf Deutsch.
Gib nur den korrigierten Text zurück, ohne Erklärung."

  # JSON sicher zusammenbauen (wichtig für Sonderzeichen)
  local payload=$(jq -n \
    --arg sys "$SYSTEM" \
    --arg usr "$*" \
    '{
      prompt: "[INST] \($sys)\n\nText:\n\($usr) [/INST]",
      n_predict: 256,
      temperature: 0.2
    }')

  # Request senden + robust Ausgabe lesen
  curl -s "$url/completion" \
    -H "Content-Type: application/json" \
    -d "$payload" \
  | jq -r '.completion // .content'
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

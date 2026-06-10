#!/usr/bin/env bash
set -e

echo "== LLM Bootstrap startet =="

# =========================
# PARAM
# =========================
MODEL_NAME=${1:-"mistral"}

# =========================
# PATHS
# =========================
LLAMA_DIR="$HOME/.local/llama.cpp"
MODEL_DIR="$HOME/models"
REPO_DIR="$MODEL_DIR/repos/$MODEL_NAME"

mkdir -p "$MODEL_DIR"

# =========================
# TOKEN CHECK
# =========================
if [ -z "${HUGGINGFACE_TOKEN}" ]; then
  echo "FEHLER: HUGGINGFACE_TOKEN nicht gesetzt"
  exit 1
fi

# =========================
# TOOLS
# =========================
command -v git >/dev/null || brew install git
command -v cmake >/dev/null || brew install cmake
command -v git-lfs >/dev/null || brew install git-lfs

git lfs install

# =========================
# LLAMA BUILD
# =========================
if [ ! -d "$LLAMA_DIR" ]; then
  echo "== clone llama.cpp =="
  git clone https://github.com/ggerganov/llama.cpp "$LLAMA_DIR"
fi

echo "== build llama.cpp =="

cd "$LLAMA_DIR"
mkdir -p build
cd build

cmake .. -DLLAMA_METAL=ON
cmake --build . --config Release

BIN="$LLAMA_DIR/build/bin/llama-cli"

# =========================
# MODEL CONFIG
# =========================
case "$MODEL_NAME" in
  mistral)
    REPO="https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.1-GGUF"
    FILE="mistral-7b-instruct-v0.1.Q4_K_M.gguf"
    TARGET="$MODEL_DIR/mistral.gguf"
    ;;
  *)
    echo "Unbekanntes Modell"
    exit 1
    ;;
esac

# =========================
# DOWNLOAD (AUTOMATISCH)
# =========================

if [ ! -f "$TARGET" ]; then
  echo "== lade Modell =="

  rm -rf "$REPO_DIR"

  AUTH_REPO=$(echo "$REPO" | sed "s#https://#https://hf:${HUGGINGFACE_TOKEN}@#")

  GIT_LFS_SKIP_SMUDGE=1 git clone "$AUTH_REPO" "$REPO_DIR"
  cd "$REPO_DIR"

  git lfs pull --include "$FILE"

  cp "$FILE" "$TARGET"
fi

# =========================
# VALIDATION
# =========================
echo "== prüfe Modell =="

MAGIC=$(head -c 4 "$TARGET")

if [ "$MAGIC" != "GGUF" ]; then
  echo "FEHLER: Modell ungültig"
  exit 1
fi

echo "== Modell OK =="

# =========================
# DONE
# =========================
echo ""
echo "== Setup fertig =="
echo ""
echo "Start:"
echo "$BIN -m $TARGET -i"
echo ""
echo "Oder:"
echo "llm was ist TCP"

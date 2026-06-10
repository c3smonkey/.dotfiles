llm() {
  local model="${LLM_MODEL:-mistral.gguf}"
  local bin="$HOME/.local/llama.cpp/build/bin/llama-cli"

  if [ -z "$*" ]; then
    "$bin" -m "$HOME/models/$model" -i
  else
    "$bin" -m "$HOME/models/$model" -p "$*"
  fi
}

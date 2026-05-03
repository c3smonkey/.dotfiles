# =========================
# Git User Switcher (FINAL CLEAN VERSION)
# =========================

# -------------------------
# USERS CONFIG
# -------------------------
GIT_USER_MARZEL_NAME="marzelwidmer"
GIT_USER_MARZEL_EMAIL="marzelwidmer@gmail.com"

GIT_USER_C3S_NAME="c3smonkey"
GIT_USER_C3S_EMAIL="c3smonkey@gmail.com"

# -------------------------
# STATUS
# -------------------------
git-who() {
  echo "========================="
  echo " Git Identity (global) "
  echo "========================="
  echo "Name : $(git config --global user.name)"
  echo "Email: $(git config --global user.email)"
}

# -------------------------
# SWITCH: MARZEL
# -------------------------
git-use-marzel() {
  git config --global user.name "$GIT_USER_MARZEL_NAME"
  git config --global user.email "$GIT_USER_MARZEL_EMAIL"
  echo "✔ Switched to MARZEL"
  git-who
}

# -------------------------
# SWITCH: C3SMONKEY
# -------------------------
git-use-c3smonkey() {
  git config --global user.name "$GIT_USER_C3S_NAME"
  git config --global user.email "$GIT_USER_C3S_EMAIL"
  echo "✔ Switched to C3SMONKEY"
  git-who
}

# -------------------------
# HELP
# -------------------------
git-user-help() {
  echo ""
  echo "Available commands:"
  echo "  git-who"
  echo "  git-use-marzel"
  echo "  git-use-c3smonkey"
  echo ""
}

# =========================
# AUTO GIT IDENTITY (DIR-BASED)
# =========================
git-auto-identity() {
  local dir=$(pwd)

  if [[ "$dir" == *"/git/github/c3smonkey"* ]]; then
    git config user.name "c3smonkey"
    git config user.email "c3smonkey@gmail.com"
  elif [[ "$dir" == *"/git/github/marzelwidmer"* ]]; then
    git config user.name "marzelwidmer"
    git config user.email "marzelwidmer@gmail.com"
  fi
}

# hook into cd
autoload -U add-zsh-hook
add-zsh-hook chpwd git-auto-identity
git-auto-identity

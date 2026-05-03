#!/usr/bin/env bash

set -e

echo "🚀 Starting Mac bootstrap..."

# =========================
# 1. Check Git
# =========================
echo "🔍 Checking Git..."
git --version

# =========================
# 2. Create folders
# =========================
echo "📁 Creating workspace folders..."
mkdir -p ~/git/github/c3smonkey
mkdir -p ~/git/github/marzelwidmer

# =========================
# 3. Clone dotfiles (c3smonkey as main)
# =========================
echo "📦 Cloning c3smonkey dotfiles..."

if [ ! -d "~/git/github/c3smonkey/.dotfiles" ]; then
  git clone git@github.com:c3smonkey/.dotfiles.git ~/git/github/c3smonkey/.dotfiles
else
  echo "✔ dotfiles already exist"
fi

# =========================
# 4. Link dotfiles (optional future expansion)
# =========================
echo "🔗 Linking dotfiles..."
ln -sf ~/git/github/c3smonkey/.dotfiles ~/.dotfiles

# =========================
# 5. Git sanity check
# =========================
echo "🧠 Checking git identity in dotfiles..."

cd ~/.dotfiles || exit

echo "Current identity:"
git config user.name
git config user.email

# =========================
# 6. SSH test
# =========================
echo "🔐 Testing GitHub SSH..."

ssh -T git@github.com || true

# =========================
# DONE
# =========================
echo "✅ Bootstrap completed!"
echo "👉 Next step: open new terminal & test git workflows"

# Git User für c3s setzen
gitsetc3s() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Not inside a git repository!"
    return 1
  fi
  git config user.name "c3sm"
  git config user.email "c3smonkey@gmail.com"
  echo "Git user set to 'c3smonkey <c3smonkey@gmail.com>' for this repository."
}

# Git User für marzel setzen
gitsetmarzel() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Not inside a git repository!"
    return 1
  fi
  git config user.name "marzelwidmer"
  git config user.email "marzelwidmer@gmail.com" # <-- hier ggf. echte E-Mail
  echo "Git user set to 'marzelwidmer <marzelwidmer@gmail.com>' for this repository."
}

# Git Fix marzel
gitfixmarzel() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not inside a git repository!"
    return 1
  }

  old=$(git remote get-url origin)

  if [[ "$old" != git@github.com:* ]]; then
    echo "Remote is not github.com, nothing to fix."
    return 0
  fi

  new=$(echo "$old" | sed 's|git@github.com:|git@github-marzel:|')
  git remote set-url origin "$new"

  echo "✔ Remote fixed:"
  echo "  $old"
  echo "  → $new"
}

# Git Fix c3s
gitfixc3s() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not inside a git repository!"
    return 1
  }

  old=$(git remote get-url origin)

  if [[ "$old" != git@github-*:* ]]; then
    echo "Remote already github.com (c3s)."
    return 0
  fi

  new=$(echo "$old" | sed 's|git@github-[^:]*:|git@github.com:|')
  git remote set-url origin "$new"

  echo "✔ Remote fixed (c3s):"
  echo "  $old"
  echo "  → $new"
}

gitwhoami() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not inside a git repository!"
    return 1
  }

  echo "📦 Repository:"
  echo "  $(basename "$(git rev-parse --show-toplevel)")"
  echo

  echo "👤 Git user (local):"
  git config --local user.name || echo "  (not set)"
  git config --local user.email || echo "  (not set)"
  echo

  echo "👤 Git user (global):"
  git config --global user.name || echo "  (not set)"
  git config --global user.email || echo "  (not set)"
  echo

  echo "🔗 Git remote:"
  git remote -v
}

sshwhoami() {
  echo "🔐 SSH identities:"
  ssh-add -l 2>/dev/null || echo "  No SSH keys loaded"
  echo

  echo "🌍 SSH config (github):"
  ssh -G github.com 2>/dev/null | grep -E "user|identityfile|hostname"
  echo

  echo "🌍 SSH config (github-marzel):"
  ssh -G github-marzel 2>/dev/null | grep -E "user|identityfile|hostname"
}

gitcontext() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not inside a git repository!"
    return 1
  }

  name=$(git config user.name)
  email=$(git config user.email)
  remote=$(git remote get-url origin 2>/dev/null)

  echo "🧠 Current Git context:"
  echo

  echo "👤 User:"
  echo "  $name <$email>"
  echo

  echo "🔗 Remote:"
  echo "  $remote"
  echo

  if [[ "$email" == *"c3s"* ]]; then
    echo "✅ Context: c3s"
  elif [[ "$email" == *"marzel"* ]]; then
    echo "✅ Context: marzel"
  else
    echo "⚠ Unknown context"
  fi
}


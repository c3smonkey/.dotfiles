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

# Git Fix
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

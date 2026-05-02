#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  generate-accounts.sh [--interactive|--non-interactive] [--quiet] [MIN_FILE] [OUT_FILE]

Defaults:
  MIN_FILE: ~/.secrets/aerc/accounts.min.conf
  OUT_FILE: ~/.secrets/aerc/accounts.conf
EOF
}

is_valid_email() {
  case "$1" in
    *@*) return 0 ;;
    *) return 1 ;;
  esac
}

prompt_email() {
  local prompt="$1"
  local current="$2"
  local value

  while true; do
    if [ -n "$current" ]; then
      read -r -p "$prompt [$current]: " value
      value="${value:-$current}"
    else
      read -r -p "$prompt: " value
    fi

    if is_valid_email "$value"; then
      printf '%s\n' "$value"
      return 0
    fi

    printf 'Invalid email. Please try again.\n' >&2
  done
}

INTERACTIVE=false
INTERACTIVE_SET=false
QUIET=false
ARGS=()

while [ "$#" -gt 0 ]; do
  case "$1" in
    --interactive|-i)
      INTERACTIVE=true
      INTERACTIVE_SET=true
      ;;
    --non-interactive|-n)
      INTERACTIVE=false
      INTERACTIVE_SET=true
      ;;
    --quiet|-q)
      QUIET=true
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      ARGS+=("$1")
      ;;
  esac
  shift
done

MIN_FILE="${ARGS[0]:-$HOME/.secrets/aerc/accounts.min.conf}"
OUT_FILE="${ARGS[1]:-$HOME/.secrets/aerc/accounts.conf}"

if [ "$INTERACTIVE_SET" = false ] && [ -t 0 ]; then
  INTERACTIVE=true
fi

mkdir -p "$(dirname "$MIN_FILE")"

if [ -f "$MIN_FILE" ]; then
  # shellcheck disable=SC1090
  source "$MIN_FILE"
fi

icloud_email="${icloud_email:-}"
gmail_email="${gmail_email:-}"

if [ "$INTERACTIVE" = true ] || [ ! -f "$MIN_FILE" ]; then
  if [ ! -t 0 ]; then
    printf 'aerc: interactive mode requires a TTY\n' >&2
    exit 1
  fi

  if [ "$QUIET" = false ]; then
    printf 'aerc account setup (minimal)\n'
  fi
  icloud_email="$(prompt_email 'iCloud email' "$icloud_email")"
  gmail_email="$(prompt_email 'Gmail email' "$gmail_email")"

  cat > "$MIN_FILE" <<EOF
icloud_email="${icloud_email}"
gmail_email="${gmail_email}"
EOF
  chmod 600 "$MIN_FILE"
  if [ "$QUIET" = false ]; then
    printf 'Wrote minimal config: %s\n' "$MIN_FILE"
  fi
fi

if [ ! -f "$MIN_FILE" ]; then
  printf 'aerc: missing minimal accounts file at %s\n' "$MIN_FILE" >&2
  printf 'Create it from: ~/.dotfiles/.config/aerc/accounts.min.conf.example\n' >&2
  exit 1
fi

if [ -z "$icloud_email" ] || [ -z "$gmail_email" ]; then
  printf 'aerc: icloud_email and gmail_email must be set in %s\n' "$MIN_FILE" >&2
  exit 1
fi

if ! is_valid_email "$icloud_email"; then
  printf 'aerc: invalid icloud_email in %s\n' "$MIN_FILE" >&2
  exit 1
fi

if ! is_valid_email "$gmail_email"; then
  printf 'aerc: invalid gmail_email in %s\n' "$MIN_FILE" >&2
  exit 1
fi

icloud_encoded="${icloud_email/@/%40}"
gmail_encoded="${gmail_email/@/%40}"

mkdir -p "$(dirname "$OUT_FILE")"

cat > "$OUT_FILE" <<EOF
# AUTO-GENERATED FILE. DO NOT EDIT DIRECTLY.
# Edit ${MIN_FILE} and rerun generate-accounts.sh (or start aerc via wrapper).

[icloud]
source = imaps://${icloud_encoded}@imap.mail.me.com:993
source-cred-cmd = security find-generic-password -a ${icloud_email} -s aerc-icloud-imap -w
outgoing = smtps://${icloud_encoded}@smtp.mail.me.com:465
outgoing-cred-cmd = security find-generic-password -a ${icloud_email} -s aerc-icloud-smtp -w
from = ${icloud_email}
default = INBOX
copy-to = Sent Messages
archive = Archive
postpone = Drafts
check-mail = 3m

[gmail]
source = imaps://${gmail_encoded}@imap.gmail.com:993
source-cred-cmd = security find-generic-password -a ${gmail_email} -s aerc-gmail-imap -w
outgoing = smtps://${gmail_encoded}@smtp.gmail.com:465
outgoing-cred-cmd = security find-generic-password -a ${gmail_email} -s aerc-gmail-smtp -w
from = ${gmail_email}
default = INBOX
copy-to = [Gmail]/Sent Mail
archive = [Gmail]/All Mail
postpone = [Gmail]/Drafts
check-mail = 3m
EOF

chmod 600 "$OUT_FILE"

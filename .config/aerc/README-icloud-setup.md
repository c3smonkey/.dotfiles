# aerc iCloud setup

This setup keeps account settings out of the repository and uses macOS Keychain for passwords.

## 1) Create an Apple app-specific password

In your Apple ID settings, create an app-specific password for Mail.

## 2) Create a private accounts file

Create a private path and copy the example config:

```bash
mkdir -p ~/.secrets/aerc
cp ~/.dotfiles/.config/aerc/accounts.conf.example ~/.secrets/aerc/accounts.conf
```

Then edit `~/.secrets/aerc/accounts.conf` with your real email addresses.

## 3) Save passwords in macOS Keychain

Run these commands and enter the app-specific passwords when prompted:

```bash
security add-generic-password -U -a "YOUR_ICLOUD_EMAIL@me.com" -s "aerc-icloud-imap" -w
security add-generic-password -U -a "YOUR_ICLOUD_EMAIL@me.com" -s "aerc-icloud-smtp" -w
security add-generic-password -U -a "YOUR_GMAIL_EMAIL@gmail.com" -s "aerc-gmail-imap" -w
security add-generic-password -U -a "YOUR_GMAIL_EMAIL@gmail.com" -s "aerc-gmail-smtp" -w
```

## 4) Reload shell and start aerc

The shell wrapper in `.zshrc` starts aerc with the dotfiles config plus your private accounts file.

```bash
exec zsh
aerc
```

If folder names differ, adjust these fields in `~/.secrets/aerc/accounts.conf`:
- `copy-to`
- `archive`
- `postpone`

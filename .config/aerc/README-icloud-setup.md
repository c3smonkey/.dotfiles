# aerc iCloud setup

This setup keeps account settings out of the repository and uses macOS Keychain for passwords.

## 0) Install dependencies

Install `w3m` so aerc can render HTML emails without filter errors:

```bash
brew install w3m
```

## 1) Create an Apple app-specific password

In your Apple ID settings, create an app-specific password for Mail.

## 2) Create a private accounts file

Recommended interactive setup:

```bash
exec zsh
aerc-setup
```

`aerc-setup` runs quietly by default.

You can also run the generator directly; it asks questions when started in a terminal:

```bash
~/.dotfiles/.config/aerc/generate-accounts.sh
```

Manual setup:

Create a private path and copy the example config:

```bash
mkdir -p ~/.secrets/aerc
cp ~/.dotfiles/.config/aerc/accounts.min.conf.example ~/.secrets/aerc/accounts.min.conf
```

Then edit `~/.secrets/aerc/accounts.min.conf` with your real email addresses.

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
You do not need to maintain `~/Library/Preferences/aerc` with this setup.
If `~/.dotfiles/.config/aerc/binds.conf` is non-empty, it is used for key bindings.
The full `accounts.conf` is generated during setup (`aerc-setup`) and then reused.
If `accounts.min.conf` changes later, run `aerc-setup` again.

```bash
exec zsh
aerc
```

If folder names differ, adjust defaults in `~/.dotfiles/.config/aerc/generate-accounts.sh`:
- `copy-to`
- `archive`
- `postpone`

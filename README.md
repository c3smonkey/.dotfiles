# .dotfiles
		vim.keymap.set("n", "<leader>mp", vim.cmd.MarkdownPreview, { desc = "[M]arkdown [P]review" })

Clone _.dotfiles_ repository in your _$HOME_ directory.

```
git clone git@github.com:c3smonkey/.dotfiles.git
```

# Brew 
```bash
brew install joshmedeski/sesh/sesh
brew install tmux
brew install reattach-to-user-namespace
brew install neovim
brew install zoxide
brew install lazygit
brew install fzf
brew install bat
brew install exa
brew install ripgrep
brew install fd
brew install alacritty
brwe install --cask weztermt 
brew install koekeishiya/formulae/skhd
brew install koekeishiya/formulae/yabai
brew install toilet
brew install lf
```


# Create Symlink

## .zshrc

```
ln -s  ~/.dotfiles/.zshrc ~/.zshrc
```

## .warp

```
ln -s  ~/.dotfiles/.warp ~/.warp
```

## .p10k.zsh

```
ln -s  ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
```

## yabai

```
ln -s  ~/.dotfiles/.config/yabai ~/.config/yabai
```

## skhd

```
ln -s  ~/.dotfiles/.config/skhd ~/.config/skhd
```

## ideavimrc

```
ln -s  ~/.dotfiles/ideavim/.ideavimrc ~/.ideavimrc
```

## nvim

```
ln -s  ~/.dotfiles/.config/nvim ~/.config/nvim
```

## tmux

### Install tmux plugin manager

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Symbolic link to .tmux.conf

```
ln -s  ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

### Install tmux plugins

```
tmux

# Press prefix + I (capital i, as in Install) to fetch the plugin.
# ctrl + s + I
```

```

### Install tmux plugin manager

https://github.com/tmux-plugins/tpm

```

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

````

### Install tmux catppuccino

https://github.com/catppuccin/tmux


# Toilet
```bash
brew install toilet
````

## Symlink fonts to installation directory

```bash
ln -s ~/.dotfiles/fonts/toilet/small.flf /opt/homebrew/share/figlet/small.flf
ln -s ~/.dotfiles/fonts/toilet/standard.flf /opt/homebrew/share/figlet/standard.flf
```

# Alacritty

```bash
ln -s ~/.dotfiles/.config/alacritty ~/.config/alacritty
```

# Wezterm

```bash
ln -s ~/.dotfiles/.config/wezterm ~/.config/wezterm
```

# LF

```bash
ln -s ~/.dotfiles/.config/lf ~/.config/lf
```




# OSW Settings

[25 Mac Settings You Have to Change](https://www.youtube.com/watch?v=psPgSN1bPLY&t=1059)

## Faster Dock

```bash
defaults write com.apple.dock autohide-delay -float 0.2; defaults write com.apple.dock autohide-time-modifier -int 0.2 ;killall Dock
```

## Add Spacer to Dock (Half Size)

```bash
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}' && killall Dock
```

## Add Spacer to Dock (Full Size)

```bash
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}' && killall Dock
```
# Keyboard
```bash
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
```


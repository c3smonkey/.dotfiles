# .dotfiles

Clone _.dotfiles_ repository in your _$HOME_ directory

```
git clone git@github.com:c3smonkey/.dotfiles.git
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
```

### Install tmux catppuccino

https://github.com/catppuccin/tmux


# Toilet
```bash
brew install toilet
```

## Symlink fonts to installation directory

```bash
ln -s ~/.dotfiles/fonts/toilet/small.flf /opt/homebrew/share/figlet/small.flf
ln -s ~/.dotfiles/fonts/toilet/standard.flf /opt/homebrew/share/figlet/standard.flf
```



























# .dotfiles

## Clone .dotfiles

Clone _.dotfiles_ repository in your _$HOME_ directory

```
git clone git@github.com:c3smonkey/.dotfiles.git
```

### Create Symlink

### .zshrc

```
ln -s  ~/.dotfiles/.zshrc ~/.zshrc
```

#### starship.toml

```
ln -s  ~/.dotfiles/.config/starship.toml ~/.config/starship.toml
```

#### yabai

```
ln -s  ~/.dotfiles/.config/yabai ~/.config/yabai
```

#### skhd

```
ln -s  ~/.dotfiles/.config/skhd ~/.config/skhd
```

#### ideavimrc

```
ln -s  ~/.dotfiles/.ideavimrc ~/.ideavimrc
```

#### nvim

```
ln -s  ~/.dotfiles/.config/nvim ~/.config/nvim
```

#### sketchybar

install the following. (see also https://www.josean.com/posts/sketchybar-setup)

```
brew tap FelixKratz/formulae
brew install sketchybar
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
brew install font-sf-pro
brew install --cask sf-symbols
```

```
brew services start sketchybar
```

```
ln -s  ~/.dotfiles/.config/sketchybar ~/.config/sketchybar
```

#### svim

```
ln -s  ~/.dotfiles/.config/svim ~/.config/svim
```

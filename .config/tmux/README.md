# tmux Shortcuts

Quick Cheat Sheet:

- Move pane: `Ctrl-f` then `h/j/k/l`
- Resize pane: `Ctrl-f` then `H/J/K/L` (Shift + `h/j/k/l`)
- Zoom pane: `Ctrl-f` then `z`

This setup uses the following tmux prefix:

- `Ctrl-f`

## Pane Navigation

Use prefix + `h/j/k/l` to move between panes:

- `Ctrl-f` then `h` -> pane left
- `Ctrl-f` then `j` -> pane down
- `Ctrl-f` then `k` -> pane up
- `Ctrl-f` then `l` -> pane right

## Pane Resize

Resize uses uppercase keys (Shift + key):

- `Ctrl-f` then `H` -> resize left (`-L 5`)
- `Ctrl-f` then `J` -> resize down (`-D 5`)
- `Ctrl-f` then `K` -> resize up (`-U 5`)
- `Ctrl-f` then `L` -> resize right (`-R 5`)

Notes:

- `H/J/K/L` means `Shift+h/j/k/l`.
- Resize mappings use repeat (`bind -r`), so holding the key keeps resizing.

## Useful Extras

- `Ctrl-f` then `z` -> toggle pane zoom (fullscreen current pane)
- `Ctrl-f` then `r` -> reload tmux config

# Neovim Setup Notes

## File Explorer

- `<leader>e`: open `mini.files` at current file (or cwd if no file)
- `<leader>ee`: open Yazi file manager

## Markdown

- `<leader>md`: open terminal markdown preview via `glow.nvim`
- Requires `glow` binary installed on the system
- macOS install: `brew install glow`

## OpenCode

- `<leader>oc`: open OpenCode in right-side terminal split
- Close split with `q` (normal mode) or `<C-q>` (terminal mode)
- Window switching works in terminal mode with `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`
- Requires `opencode` binary in `PATH`

## Terminal

- `<leader>ot`: toggle centered terminal modal (`90% x 85%`)
- Close modal with `q` (normal mode) or `<C-q>` (terminal mode)

## Undo

- `<leader>u`: toggle UndoTree sidebar
- Persistent undo is enabled via `undofile`

## Copilot

- Plugin: `zbirenbaum/copilot.lua`
- Suggestions are auto-triggered in insert mode.
- macOS note: `<M-...>` means **Option/Alt** (`⌥`) when terminal sends Meta.

### Copilot Chat

- `<leader>cc`: toggle Copilot Chat window
- Chat opens as centered floating modal (`90% x 85%`, rounded border)
- Press `<CR>` to send in both normal and insert mode

### Copilot keymaps

- `⌥l` (`<M-l>`): accept suggestion
- `⌥]` (`<M-]>`): next suggestion
- `⌥[` (`<M-[>`): previous suggestion
- `Ctrl+]` (`<C-]>`): dismiss suggestion
- `<Tab>`: accept Copilot if visible, otherwise normal tab
- `<S-Tab>`: previous Copilot if visible, otherwise normal shift-tab

If Option keys do not work in terminal:

- iTerm2: Profile -> Keys -> Left/Right Option Key = `Esc+`
- Apple Terminal: Profile -> Keyboard -> `Use Option as Meta key`

## LSP Keymaps

- `gd`: definition
- `gi`: implementation
- `gt`: type definition
- `gr`: references
- `grr`: references
- `grn`: rename
- `gra`: code action
- `grx`: diagnostics to quickfix
- `ge` / `gE`: next / previous diagnostic
- `K`: hover docs
- `,f`: format buffer
- `,i`: organize imports via code action
- `,se`: show diagnostics float for current line

## References flow (quickfix)

Custom `qf` `<CR>` behavior:

1. Jump to selected quickfix/location entry
2. Close quickfix/location list
3. Run `:only` to keep only target window

This makes `grr -> select -> Enter` behave like focused jump.

## Kotlin LSP testing

Test project path:

- `testfiles/kotlin-lsp-test`

Both build systems are present for root detection tests:

- Gradle: `build.gradle.kts`, `settings.gradle.kts`
- Maven: `pom.xml`

Test files:

- `testfiles/kotlin-lsp-test/src/main/kotlin/demo/Test1.kt`
- `testfiles/kotlin-lsp-test/src/main/kotlin/demo/Test2.kt`

First open can be slow while indexing/downloading. Wait a few seconds before testing `gd/grr`.

## Troubleshooting

- Show attached clients: `:LspInfo`
- Raw clients: `:lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))`
- Check messages: `:messages`
- LSP health: `:checkhealth vim.lsp`

## Test project git hygiene

`testfiles/kotlin-lsp-test/.gitignore` currently ignores:

- `build/`
- `target/`

If needed, add `.gradle/` too.

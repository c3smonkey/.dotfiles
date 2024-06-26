-- Markdown specific settings

vim.opt.wrap = true -- Wrap text
vim.opt.breakindent = true -- Match indent on line break
vim.opt.linebreak = true -- Line break on whole words

-- Allow j/k when navigating wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Spell check
vim.opt.spelllang = "en_us,de,de_ch"

vim.opt.spell = true

-- line numbers
vim.opt.number = false
vim.opt.relativenumber = false

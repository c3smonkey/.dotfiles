-- ============================================
-- Keybindings Konfiguration
-- ============================================

-- Leader Key ist bereits in init.lua gesetzt: Space

-- ============================================
-- Insert Mode
-- ============================================

-- 'jj' als Escape - schneller Ausstieg aus Insert Mode
vim.keymap.set('i', 'jj', '<Esc>', { 
  desc = 'Exit insert mode with jj',
  noremap = true,
  silent = true 
})

-- ============================================
-- Normal Mode - Clear Search Highlighting
-- ============================================

-- Esc entfernt Such-Highlighting
vim.keymap.set('n', '<Esc>', function()
  vim.cmd.nohlsearch()
end, { 
  desc = 'Clear search highlighting',
  silent = true 
})

-- ============================================
-- Normal/Visual Mode
-- ============================================

-- Disable Space in Normal/Visual mode (verhindert Standard-Funktion von Space)
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- ============================================
-- File Operations
-- ============================================

-- Save file
vim.keymap.set('n', '<leader>w', function()
  vim.cmd.write()
end, { 
  desc = 'Save file',
  silent = true 
})

-- Quit
vim.keymap.set('n', '<leader>q', function()
  vim.cmd.quit()
end, { 
  desc = 'Quit',
  silent = true 
})

-- Save and quit
vim.keymap.set('n', '<leader>x', function()
  vim.cmd.xit()
end, { 
  desc = 'Save and quit',
  silent = true 
})

-- ============================================
-- Config Reload
-- ============================================

-- Reload komplette Neovim Config
vim.keymap.set('n', '<leader>rr', function()
  vim.cmd.source('$MYVIMRC')
  vim.notify('Config reloaded!', vim.log.levels.INFO)
end, { 
  desc = 'Reload config',
  silent = true 
})

-- ============================================
-- Mini.pick - Fuzzy Finder
-- ============================================

-- Find files
vim.keymap.set('n', '<leader>sf', function()
  require('mini.pick').builtin.files()
end, { 
  desc = 'Find files',
  silent = true 
})

-- Live grep (search in files)
vim.keymap.set('n', '<leader>sg', function()
  require('mini.pick').builtin.grep_live()
end, { 
  desc = 'Live grep',
  silent = true 
})

-- Find buffers
vim.keymap.set('n', '<leader>sb', function()
  require('mini.pick').builtin.buffers()
end, { 
  desc = 'Find buffers',
  silent = true 
})

-- ============================================
-- Buffer Navigation
-- ============================================

-- Next buffer
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', {
  desc = 'Next buffer',
  silent = true
})

vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', {
  desc = 'Next buffer',
  silent = true
})

-- Previous buffer
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', {
  desc = 'Previous buffer',
  silent = true
})

vim.keymap.set('n', '<leader>bb', '<cmd>bprevious<CR>', {
  desc = 'Previous buffer',
  silent = true
})

-- Close buffer
vim.keymap.set('n', '<leader>bc', '<cmd>bdelete<CR>', {
  desc = 'Close buffer',
  silent = true
})

-- ============================================
-- Mini.files - File Explorer
-- ============================================

-- Open file explorer
vim.keymap.set('n', '<leader>wn', function()
  require('mini.files').open()
end, { 
  desc = 'Open file explorer',
  silent = true 
})
-- Yazi
vim.keymap.set({ 'n', 'v' }, '<leader>ee', '<cmd>Yazi<CR>',  { desc = 'Open Yazi'})


-- ============================================
-- Window Navigation
-- ============================================

vim.keymap.set('n', '<C-h>', '<C-w>h', { 
  desc = 'Move to left window',
  silent = true 
})

vim.keymap.set('n', '<C-j>', '<C-w>j', { 
  desc = 'Move to bottom window',
  silent = true 
})

vim.keymap.set('n', '<C-k>', '<C-w>k', { 
  desc = 'Move to top window',
  silent = true 
})

vim.keymap.set('n', '<C-l>', '<C-w>l', { 
  desc = 'Move to right window',
  silent = true 
})

-- ============================================
-- Visual Mode - Better Indenting
-- ============================================

-- Indent left and keep selection
vim.keymap.set('v', '<', '<gv', { 
  desc = 'Indent left and reselect',
  silent = true 
})

-- Indent right and keep selection
vim.keymap.set('v', '>', '>gv', { 
  desc = 'Indent right and reselect',
  silent = true 
})


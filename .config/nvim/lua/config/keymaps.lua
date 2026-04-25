vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR><Esc>', {
  desc = 'Clear search',
})

vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', {
  desc = 'Save',
})

vim.keymap.set('n', '<leader>q', '<cmd>quit<CR>', {
  desc = 'Quit window',
})

vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', {
  desc = 'Delete buffer',
})

vim.keymap.set('n', '<leader>Q', '<cmd>qa<CR>', {
  desc = 'Quit all',
})

vim.keymap.set('n', '<leader>W', '<cmd>wa<CR>', {
  desc = 'Save all',
})

vim.keymap.set('n', '<leader>Z', '<cmd>wqa<CR>', {
  desc = 'Save and quit all',
})

vim.keymap.set('n', '<C-h>', '<C-w>h', {
  desc = 'Window left',
})

vim.keymap.set('n', '<C-j>', '<C-w>j', {
  desc = 'Window down',
})

vim.keymap.set('n', '<C-k>', '<C-w>k', {
  desc = 'Window up',
})

vim.keymap.set('n', '<C-l>', '<C-w>l', {
  desc = 'Window right',
})

vim.keymap.set('n', '<leader>kf', '<cmd>KotlinFormat<CR>', {
  desc = 'Kotlin format',
})

vim.keymap.set('n', '<leader>ko', '<cmd>KotlinOrganizeImports<CR>', {
  desc = 'Kotlin imports',
})

vim.keymap.set('n', '<leader>kh', '<cmd>KotlinInlayHintsToggle<CR>', {
  desc = 'Kotlin hints',
})

vim.keymap.set('n', '<leader>ks', '<cmd>KotlinSymbols<CR>', {
  desc = 'Kotlin symbols',
})

vim.keymap.set('n', '<leader>ki', '<cmd>KotlinImplementation<CR>', {
  desc = 'Kotlin impl',
})

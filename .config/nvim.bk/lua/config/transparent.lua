local groups = {
  'Normal',
  'NormalNC',
  'SignColumn',
  'EndOfBuffer',
  'LineNr',
  'FoldColumn',
  'CursorLineNr',
  'StatusLine',
  'StatusLineNC',
  'NormalFloat',
  'FloatBorder',
}

local function set_transparent_background()
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = 'none' })
  end
end

local augroup = vim.api.nvim_create_augroup('TransparentBackground', { clear = true })

vim.api.nvim_create_autocmd('ColorScheme', {
  group = augroup,
  callback = set_transparent_background,
})

set_transparent_background()

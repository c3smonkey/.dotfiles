local M = {}
local transparent = require('colorscheme.transparent')

local themes = { 'gruvbox', 'habamax' }

local function get_theme_accent_fg()
  local candidates = { 'GruvboxYellowBold', 'GruvboxYellow', 'DiagnosticWarn', 'WarningMsg' }
  for _, name in ipairs(candidates) do
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
    if ok and hl and hl.fg then
      return hl.fg
    end
  end
  return nil
end

local function apply_tabline_accent()
  local fg = get_theme_accent_fg()
  if not fg then
    return
  end

  vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { fg = fg, bg = 'none', bold = true })
  vim.api.nvim_set_hl(0, 'TabLineSel', { fg = fg, bg = 'none', bold = true })
end

local function apply_theme(name)
  vim.o.background = 'dark'

  if name == 'gruvbox' then
    local ok, gruvbox = pcall(require, 'gruvbox')
    if ok then
      gruvbox.setup({ contrast = 'hard' })
      vim.cmd('colorscheme gruvbox')
      M.current_theme = 'gruvbox'
      return
    end
  end

  vim.cmd('colorscheme habamax')
  M.current_theme = 'habamax'
end

function M.cycle_theme()
  local idx = 1
  for i, theme in ipairs(themes) do
    if theme == M.current_theme then
      idx = i
      break
    end
  end

  local next_idx = idx + 1
  if next_idx > #themes then
    next_idx = 1
  end

  apply_theme(themes[next_idx])
  transparent.apply_current({ skip_reset = true })
  apply_tabline_accent()
  vim.notify('Theme: ' .. M.current_theme, vim.log.levels.INFO)
end

local augroup = vim.api.nvim_create_augroup('TransparentBackground', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  group = augroup,
  callback = function()
    transparent.apply_current({ skip_reset = true })
    apply_tabline_accent()
  end,
})

apply_theme('gruvbox')
transparent.apply_current({ skip_reset = true })
apply_tabline_accent()

return M

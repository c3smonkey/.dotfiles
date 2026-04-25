local M = {}

M.current_mode = 'moderate'

local groups = {
  normal = {
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
  },
  minimal = {
    'Normal',
    'NormalNC',
    'EndOfBuffer',
    'NormalFloat',
    'FloatBorder',
    'TabLine',
    'TabLineSel',
    'TabLineFill',
    'MiniTablineCurrent',
    'MiniTablineVisible',
    'MiniTablineHidden',
    'MiniTablineFill',
  },
  moderate = {
    'Normal',
    'NormalNC',
    'SignColumn',
    'EndOfBuffer',
    'LineNr',
    'NormalFloat',
    'FloatBorder',
    'TabLine',
    'TabLineSel',
    'TabLineFill',
    'MiniTablineCurrent',
    'MiniTablineVisible',
    'MiniTablineHidden',
    'MiniTablineModifiedCurrent',
    'MiniTablineModifiedVisible',
    'MiniTablineModifiedHidden',
    'MiniTablineFill',
    'MiniTablineTabpagesection',
    'MiniTablineTrunc',
  },
  full = {
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
    'TabLine',
    'TabLineSel',
    'TabLineFill',
    'MiniTablineCurrent',
    'MiniTablineVisible',
    'MiniTablineHidden',
    'MiniTablineModifiedCurrent',
    'MiniTablineModifiedVisible',
    'MiniTablineModifiedHidden',
    'MiniTablineFill',
    'MiniTablineTabpagesection',
    'MiniTablineTrunc',
  },
}

local function set_groups_bg(target_groups, bg)
  for _, group in ipairs(target_groups) do
    vim.api.nvim_set_hl(0, group, { bg = bg })
  end
end

local function restore_theme_defaults()
  local name = vim.g.colors_name
  if name and name ~= '' then
    vim.cmd('silent! colorscheme ' .. name)
  end
end

function M.set(mode, opts)
  if mode ~= 'none' and mode ~= 'minimal' and mode ~= 'moderate' and mode ~= 'full' then
    return
  end

  M.current_mode = mode

  if not (opts and opts.skip_reset) then
    restore_theme_defaults()
  end

  if mode == 'none' then
    return
  end

  set_groups_bg(groups[mode], 'none')
end

function M.apply_current(opts)
  M.set(M.current_mode, opts)
end

function M.cycle()
  local order = { 'none', 'minimal', 'moderate', 'full' }
  local idx = 1
  for i, mode in ipairs(order) do
    if mode == M.current_mode then
      idx = i
      break
    end
  end

  local next_idx = idx + 1
  if next_idx > #order then
    next_idx = 1
  end

  M.set(order[next_idx])
  vim.notify('Transparency: ' .. M.current_mode, vim.log.levels.INFO)
end

return M

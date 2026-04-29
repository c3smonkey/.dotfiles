-- ╭─────────────────────────────────────────────────────────╮
-- │  mini.nvim Module Configuration                         │
-- ╰─────────────────────────────────────────────────────────╯

-- mini.basics: Common configuration presets
local ok_basics, basics = pcall(require, "mini.basics")
if ok_basics then
  basics.setup({
    options = {
      basic = true,         -- number, ignorecase, clipboard, etc.
      extra_ui = false,     -- winblend, listchars, pumheight
      win_borders = 'auto', -- Infers from 'winborder' option
    },
    mappings = {
      basic = true,              -- jk improvements, Ctrl+S save, etc.
      option_toggle_prefix = [[\]],  -- \w für wrap, \s für spell, etc.
      windows = false,           -- Disabled: Du hast eigene window navigation
      move_with_alt = false,     -- Disabled: Standard movement ist besser
    },
    autocommands = {
      basic = true,              -- Highlight on yank, terminal insert mode
      relnum_in_visual_mode = false,
    },
    silent = false,
  })
end

-- mini.surround: Surround actions (sa/sd/sr)
local ok_surround, surround = pcall(require, "mini.surround")
if ok_surround then
  surround.setup({
    -- Default mappings:
    -- sa{motion}{char} = Add surrounding
    -- sd{char} = Delete surrounding
    -- sr{old}{new} = Replace surrounding
    -- sf/sF = Find surrounding (forward/backward)
    -- sh = Highlight surrounding
    -- sn = Update n_lines (wie viele Zeilen suchen)
  })
end

-- mini.pairs: Auto-close pairs
local ok_pairs, pairs = pcall(require, "mini.pairs")
if ok_pairs then
  pairs.setup({
    -- In which modes mappings should be created
    modes = { insert = true, command = false, terminal = false },
    
    -- Global mappings for auto-pairing
    mappings = {
      ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
      ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
      ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
      
      [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
      [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
      ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
      
      ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
      ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
      ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
    },
  })
end

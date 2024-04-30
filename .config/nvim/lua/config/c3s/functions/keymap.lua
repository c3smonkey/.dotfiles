local K = {}

-- keymaps are silent and noremap by default
function K.keymap(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  opts.noremap = opts.noremap ~= false
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return K

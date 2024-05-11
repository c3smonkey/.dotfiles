local ToggleTerm = {}

ToggleTerm = {

  bpytop = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "bpytop", direction = "float" })
    return t:toggle()
  end,

  terminal = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ direction = "float" })
    return t:toggle()
  end,


  lazygit = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "lazygit", direction = "float" })
    return t:toggle()
  end,

  lf = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "lf", direction = "float" })
    return t:toggle()
  end,

}

return ToggleTerm

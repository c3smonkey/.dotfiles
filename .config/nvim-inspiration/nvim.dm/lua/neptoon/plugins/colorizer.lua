-- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
-- https://github.com/norcalli/nvim-colorizer.lua
return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup()
  end
}

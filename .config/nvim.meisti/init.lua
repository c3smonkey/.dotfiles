--
-- Heavily inspired by https://github.com/harrisoncramer/nvim
--

-- core settings
require("neptoon.settings")

-- lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load plugins from lua/plugins/ directory
require("lazy").setup("neptoon.plugins")

-- keyboard shortcuts
require("neptoon.keymaps")

-- language servers
require("neptoon.lsp")

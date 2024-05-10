-- session management
-- https://github.com/olimorris/persisted.nvim
return {
  "olimorris/persisted.nvim",
  priority = 1000, -- make sure it loads very early, ie. before a dashboard
  config = function()
    require("persisted").setup({
      autoload = true,
    })
  end
}

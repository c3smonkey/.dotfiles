local ok, fzf = pcall(require, "fzf-lua")
if not ok then
  return
end

fzf.setup({
   winopts = {
    height = 0.85,
    width = 0.80,
    -- preview = { layout = "vertical" },
    preview = { layout =  "horizontal"},
    -- preview = { hidden = true},
  },
})



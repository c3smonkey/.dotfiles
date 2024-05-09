return {
  "akinsho/bufferline.nvim",
  config = function()
    require("bufferline").setup {
      options = {
        numbers = function(opts)
          return string.format('%s', opts.id)
        end,
        diagnostics = 'nvim_lsp'
      }
    }
  end
}

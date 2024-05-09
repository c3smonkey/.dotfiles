return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end 

        -- Navigation
        map('n', '<leader>dn', function()
          if vim.wo.diff then return '<leader>dn' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true, desc = "next diff"})

        map('n', '<leader>dp', function()
          if vim.wo.diff then return '<leader>dp' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true, desc = "previous diff"})

        map('n', '<leader>ds', gs.preview_hunk, { desc = "preview diff" })
        map('n', '<leader>dr', gs.reset_hunk, { desc = "reset diff" })
      end
    })
  end
}

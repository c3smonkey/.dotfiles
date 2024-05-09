-- telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization.
-- https://github.com/nvim-telescope/telescope.nvim
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require('telescope')

    telescope.load_extension('fzf')
    telescope.load_extension('persisted')
    telescope.load_extension('aerial')

    telescope.setup({
      defaults = {
        cache_picker = {
          num_pickers = 10
        }
      },
      pickers = {
        buffers = {
          sort_lastused = true,
          ignore_current_buffer = true,
        }
      }
    })

    local builtin = require('telescope.builtin')

    vim.keymap.set("n", '<leader>tt', builtin.builtin, { desc = "Open [t]elescope" })
    vim.keymap.set("n", '<leader>tp', builtin.resume, { desc = "Open [p]revious telescope instance" })
    vim.keymap.set("n", '<leader>tP', builtin.pickers, { desc = "Open list of previous telescope [p]ickers" })
    vim.keymap.set("n", '<leader>ts', telescope.extensions.aerial.aerial, { desc = "Find [s]ymbols (aerial)" })
    vim.keymap.set("n", '<leader>o', builtin.find_files, { desc = "[O]pen files" })
    vim.keymap.set("n", '<leader>O', builtin.git_files, { desc = "[O]pen git files" })
    vim.keymap.set("n", '<leader>b', builtin.buffers, { desc = "Find [b]uffers" })
    vim.keymap.set("n", '<leader>f', builtin.live_grep, { desc = "[F]ind in files" })
    vim.keymap.set("n", '<leader>w', builtin.grep_string, { desc = "Search for [w]ord under cursor in files" })
  end
}

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = 45,
      },
      -- change folder arrow icons
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    vim.keymap.set("n", "<leader>ee", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file [E]xplor[e]r" }) -- toggle file explorer
    vim.keymap.set(
      "n",
      "<leader>ef",
      "<CMD>NvimTreeFindFileToggle<CR>",
      { desc = "Toggle file [E]xplorer On Current [F]ile" }
    ) -- toggle file explorer on current file
    vim.keymap.set("n", "<leader>ec", "<CMD>NvimTreeCollapse<CR>", { desc = "[C]ollapse File [E]xplorer" }) -- collapse file explorer
    vim.keymap.set("n", "<leader>er", "<CMD>NvimTreeRefresh<CR>", { desc = "[R]efresh File [E]xplorer" }) -- refresh file explorer
  end,
}

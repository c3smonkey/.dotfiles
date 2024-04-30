return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    --local dashboard = require("alpha.themes.startify")
    local dashboard = require("alpha.themes.dashboard")
    -- Set header
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }
    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", " > New File", "<cmd>ene<CR>"),
      -- dashboard.button("ee", " > Toggle file [E]xplor[e]r", "<CMD>Neotree current filesystem reveal left<CR>"),
      dashboard.button("ee", " > Toggle file [e]xplor[e]r", "<CMD>NvimTreeToggle<CR>"),
      dashboard.button("sf", "󰱼 > [s]earch [f]ile", "<cmd>Telescope find_files<CR>"),
      dashboard.button("sw", " > [s]earch [W]ord", "<cmd>Telescope live_grep<CR>"),
      dashboard.button(";wr", "󰁯 > [Workspace] [r]estore For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", " > [q]uit NVIM", "<cmd>qa<CR>"),
    }
    -- Send config to alpha
    alpha.setup(dashboard.opts)
    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

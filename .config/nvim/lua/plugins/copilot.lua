require("config.c3s.globals")

local plugin = "copilot.vim"

return {
  -- Copilot
  {
    "github/" .. plugin,
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "isx" },
    enabled = Is_Enabled(plugin),
    lazy = false,  -- optional, sofort laden
  },

  -- Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "github/copilot.vim" },
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "isx" },
    lazy = false,  -- sofort laden
    config = function()
      require("CopilotChat").setup({
        panel_width = 80,
        chat_borders = true,
      })

      -- Copilot Chat Keymaps
      -- vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "Open Copilot Chat" })
      -- vim.keymap.set("n", "<leader>co", "<cmd>CopilotChatOpen<CR>", { desc = "Open Chat panel" })
      -- vim.keymap.set("n", "<leader>cC", "<cmd>CopilotChatClose<CR>", { desc = "Close Copilot Chat panel" })
    end,
  },

  -- TODO: add other Copilot keybindings if needed
}


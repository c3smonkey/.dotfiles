return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      auto_installed = true,
      ensure_installed = {
        "lua",
        "javascript",
        "html",
        "typescript",
        "yaml",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "dockerfile",
        "vim",
        "gitignore",
        "kotlin",
        "go",
        "python",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

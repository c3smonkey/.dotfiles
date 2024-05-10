return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-context",
  },
  build = ":TSUpdate",
  config = function()
    -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
    vim.defer_fn(function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "vim",
          "lua",
          "java",
          "kotlin",
          "javascript",
          "typescript",
          "go",
          "rust",
          "css",
          "bash",
          "json",
          "sql",
          "dockerfile",
          "html",
          "python",
          "markdown",
          "elixir",
          "erlang"
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        },
        autotag = {
          enable = true
        },
        indent = {
          enable = true
        },
        context = {
          enable = true
        }
      })
    end, 0)
  end
}

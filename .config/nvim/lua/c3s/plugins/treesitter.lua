return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "vim",
        "vimdoc",
        "kotlin",
        "go",
        "python",
        "rust",
        "java",
        "toml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          -- NOTE: Incremental selection CRTL-N, CRTL-S, CRTL-R
          init_selection = "<C-n>",
          node_incremental = "<C-n>",
          scope_incremental = "<C-s>",
          node_decremental = "<C-r>",
        },
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
    },
    dependencies = {
      -- 1. nvim-treesitter-textobjects:
      --    Provides syntax-aware text objects for precise selections.
      --    Allows custom mappings for selecting, moving, and manipulating code blocks.
      --    Enhances navigation within your codebase.
      "nvim-treesitter/nvim-treesitter-textobjects",

      -- 2. nvim-treesitter-refactor:
      --    Highlights symbol definitions and usages.
      --    Supports smart renaming within the current scope.
      --    Simplifies navigation to definitions.
      "nvim-treesitter/nvim-treesitter-refactor",

      -- 3. nvim-treesitter-context:
      --    Displays surrounding lines for context.
      --    Improves code readability by showing nearby code.
      --    Helps you understand the structure of your code.
      "nvim-treesitter/nvim-treesitter-context",

      -- 4. nvim-treesitter-completion:
      --    Enhances autocompletion using treesitter-based context.
      "nvim-treesitter/completion-treesitter",

      -- 5. nvim-ts-autotag:
      --    Automatically closes and renames HTML and JSX tags.
      --    Ensures well-formed code without manual effort.
      --    Boosts productivity during web development.
      "windwp/nvim-ts-autotag",
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
}

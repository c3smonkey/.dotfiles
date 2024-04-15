return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/completion-treesitter",
        "windwp/nvim-ts-autotag",
    },
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
        }
    },
    indent = {
        enable = true
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            -- NOTE: Incremental selection CRTL-N (next), CRTL-S (section), CRTL-P (previous)
            init_selection = "<C-n>",
            node_incremental = "<C-n>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-p>",
        },
    },
    auto_install = true,

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end
}

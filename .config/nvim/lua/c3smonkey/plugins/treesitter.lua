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
                "java",
                "toml",
                "bicep",
                "csv",
                "json",
                "xml",
                "yaml",
                "tmux"
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
            highlight = {
                enable = true,
            },
             indent = { enable = true },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-refactor",
            "nvim-treesitter/nvim-treesitter-context",
            "nvim-treesitter/completion-treesitter",
            "windwp/nvim-ts-autotag",
        },
        config = function(_, opts)
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}

require("config.c3s.globals")

local plugin = "nvim-treesitter"

return {

    "nvim-treesitter/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    ft = {
        "bash",
        "c",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "vim",
        "vimdoc",
        "go",
        "python",
        "java",
        "toml",
        "kotlin",
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/completion-treesitter",
        "windwp/nvim-ts-autotag",
    },
    opts = function(_, opts)
        if Use_Default_Opts(plugin) then
            opts = opts
        else
            opts.auto_install = true
            opts.ensure_installed = {
                "bash",
                "c",
                "html",
                "lua",
                "luadoc",
                "markdown",
                "vim",
                "vimdoc",
                "go",
                "python",
                "java",
                "toml",
                "kotlin",
            }
            opts.incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-n>",
                    node_incremental = "<C-n>",
                    scope_incremental = "<C-s>",
                    node_decremental = "<C-p>",
                },
            }
            opts.highlight = {
                enable = true,
                disabled = {
                    "css", "markdown",
                },
                additional_vim_regex_highlighting = true,
            }
            opts.indent = { enable = true }
        end
    end,

    config = function(_, opts)
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup(opts)
    end,
}

return {
    {
        "numToStr/Comment.nvim", opts = {}
    },
    -- Highlight todo, notes, etc in comments
    -- WARN: to enable it wirte WARN:
    -- INFO: to enable it write INFO:
    -- NOTE: to enable it write NOTE:
    -- INFO: to enable it write INFO:
    -- FIXME: to enable it wirte FIXME:
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            signs = false
        }
    },
}

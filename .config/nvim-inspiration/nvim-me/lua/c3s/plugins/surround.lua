return {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    config = true,
    -- ysiw  yank surround inner word
    -- yss)  yank surround sentence
    -- cs"'  change surround " to '
    -- ds"   delete surround "
    -- yssb  yank surround sentence
    -- yss)  yank surround sentence
}

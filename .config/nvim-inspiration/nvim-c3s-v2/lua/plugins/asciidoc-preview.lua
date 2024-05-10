require("config.c3s.globals")

local plugin = "nvim-asciidoc-preview"

return {
    {
        "tigion/"  .. plugin,
        enabled = Is_Enabled(plugin),
        cmd = { "AsciiDocPreview" },
        ft = { "asciidoc" },
        build = "cd server && npm install",
        opts = function(_, opts)
            if Use_Default_Opts(plugin) then
                opts = opts
            else
                opts = {}
            end
            if not Use_Default_Keys(plugin) then
                Keymap("n", "<leader>pa", "<cmd>AsciiDocPreview<cr>", { desc = "[p]review [a]sciiDoc" })
            end
        end,
    },
}

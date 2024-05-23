local session = require("luasnip.session")

local env = session.config.snip_env
local s = env["s"]
local t = env["t"]
local i = env["i"]
local parse = env["parse"]

-- https://ejmastnak.com/tutorials/vim-latex/luasnip/
return {
    -- A snippet that expands the trigger "hi" into the string "Hello, world!".
    require("luasnip").snippet(
            { trig = "hi" },
            { t("Hello, world!") }
    ),

    -- To return multiple snippets, use one `return` statement per snippet file
    -- and return a table of Lua snippets.
    require("luasnip").snippet(
            { trig = "foo" },
            { t("Another snippet.") }
    ),

    s({ trig = "co", name = "Constant", dscr = "Insert a constant (c3s)" }, {
        t("const "), i(1, "name"), t(" = "), i(2, "value")
    }),

}

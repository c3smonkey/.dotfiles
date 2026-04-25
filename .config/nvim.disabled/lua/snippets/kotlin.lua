-- see LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	-- kotlin function oneliner
	s({trig="ktfun", dscr="Snippet for function declaration in Kotlin (oneliner)"},
		{
			t("fun "),
			i(1, "main"),
			t("("),
			i(2, "args"),
			t(": "),
			i(3, "Array<String>"),
			t(") = "),
			i(4, "\"Response\" "),
		}
	),

	-- kotlin data class
	s({trig="ktData", dscr="Snippet for data class in Kotlin"},
		{
			t("data class "),
			i(1, "Clazz"),
			t("(val "),
			i(2, "param"),
			t(": "),
			i(3, "Type"),
			t(")"),
		}
	),

}

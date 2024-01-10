-- add LaTeX snippets to plaintext files
require("luasnip").filetype_extend("text", { "tex" })

return {
    s({trig="note", dscr="new anki note"},
      fmta(
        [["<>";"<>"]],
        { 
            i(0),
            i(1),
        }
      )
    ),
    s({trig="lim", dscr="latex inline math for anki"},
      fmta(
        "[$]<>[/$]",
        { i(0) }
      )
    ),
    s({trig="ldm", dscr="latex display math for anki"},
      fmta(
        "[$$]<>[/$$]",
        { i(0) }
      )
    ),
}

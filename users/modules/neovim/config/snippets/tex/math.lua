return {
    s({trig="lecdefs", dscr="preamble definitions for lecture notes"},
        {
            t({
                "\\usepackage{amsthm}",

                "\\theoremstyle{definition}",
                "\\newtheorem{definition}{Definition}[section]",

                "\\theoremstyle{remark}",
                "\\newtheorem*{remark}{Remark}",
            })
        }
    ),
    s({trig="def", dscr="definition environment"},
      fmta(
        [[
          \begin{definition}[<>]
              <>
          \end{definition}
        ]],
        { 
            i(1),
            i(0),
        }
      )
    ),
    s({trig="hwdefs", dscr="preamble definitions for homework assignments"},
        {
            t({
                "\\usepackage{amsthm}",

                "\newtheorem*{answer}{Answer}",
            })
        }
    ),
    s({trig="ans", dscr="answer environment"},
      fmta(
        [[
          \begin{answer}
              <>
          \end{answer}
        ]],
        { i(0) }
      )
    ),
    s({trig="eq", dscr="equation environment"},
      fmta(
        [[
          \begin{equation}
              <>
          \end{equation}
        ]],
        { i(0) }
      )
    ),
    s({trig="ff", dscr="fraction"},
      fmta("\\frac{<>}{<>}", { i(1, "num"), i(2, "denom") })
    ),
}

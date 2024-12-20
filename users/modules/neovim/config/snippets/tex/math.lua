return {
    s({trig="lecdefs", dscr="preamble definitions for lecture notes"},
        {
            t({
                "\\usepackage{amsmath}",
                "\\usepackage{amsthm}",

                "\\newtheorem{definition}{Definition}[section]",
                "\\newtheorem{example}{Example}[section]",
            })
        }
    ),
    s({trig="hwdefs", dscr="preamble definitions for homework assignments"},
        {
            t({
                "\\usepackage{amsthm}",

                "\newtheorem*{answer}{Answer}",
            })
        }
    ),
    s({trig="ff", dscr="fraction"},
      fmta("\\frac{<>}{<>}", { i(1, "num"), i(2, "denom") })
    ),
}

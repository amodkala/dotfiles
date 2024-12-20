return {
    s({trig="pre", dscr="basic preamble"},
      fmta(
        [[
            \documentclass[12pt, a4paper]{article}
            \usepackage{amsmath}
            \title{<>}
            \author{Amod Kala}
            \date{\today}

            \begin{document}
                <>
            \end{document}
        ]],
        {
            i(1),
            i(0),
        }
      )
    ),
    s({trig="toc", dscr="front page with title and table of contents"},
        t({
            "\\maketitle",
            "\\tableofcontents",
            "\\pagebreak",
        })
    ),
    s({trig="env", dscr="new environment"},
      fmta(
        [[
          \begin{<>}[<>]
              <>
          \end{<>}
        ]],
        { 
            i(1),
            i(2),
            i(0),
            rep(1),
        }
      )
    ),
    s({trig="alist", dscr="list with alphabet character bullets"},
      fmta(
        [[
            \begin{enumerate}
                \renewcommand{\labelenumi}{\alph{enumi})}
                \item
                    <>
                \item
                \item
            \end{enumerate}
        ]],
        {
            i(0),
        }
      )
    ),
}

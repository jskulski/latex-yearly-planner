package texsnippets

const Document = "document"
const document = `\documentclass[9pt]{extarticle}

\usepackage{geometry}
\usepackage[table]{xcolor}
\usepackage{showframe}
\usepackage{calc}
\usepackage{dashrule}
\usepackage{setspace}
\usepackage{array}
\usepackage{tikz}
\usepackage{varwidth}
\usepackage{blindtext}
\usepackage{tabularx}
\usepackage{wrapfig}
\usepackage{makecell}
\usepackage{graphicx}
\usepackage{multirow}
\usepackage{amssymb}
\usepackage{expl3}
\usepackage{leading}
\usepackage{pgffor}
\usepackage{hyperref}
\usepackage{marginnote}
\usepackage{adjustbox}
\usepackage{multido}

\geometry{paperwidth={{.Device.Paper.Width}}, paperheight={{.Device.Paper.Height}}}
\geometry{
             top={{ .Layout.Margin.Top }},
          bottom={{ .Layout.Margin.Bottom }},
            left={{ .Layout.Margin.Left }},
           right={{ .Layout.Margin.Right }},
  marginparwidth={{ .Layout.MarginNotes.Width }},
    marginparsep={{ .Layout.MarginNotes.Margin }}
}
{{ .Layout.MarginNotes.Reverse }}

\pagestyle{empty}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\parindent=0pt
\fboxsep0pt

\newcommand{\remainingHeight}{%
  \ifdim\pagegoal=\maxdimen
  \dimexpr\textheight-9.4pt\relax
  \else
  \dimexpr\pagegoal-\pagetotal-\lineskip-9.4pt\relax
  \fi%
}

\newcommand{\myLengthTwoColumnsSeparatorWidth}{ {{- .Layout.Sizes.TwoColumnsSeparatorSize -}} }
\newcommand{\myLengthTwoColumnWidth}{\dimexpr.5\linewidth-.5\myLengthTwoColumnsSeparatorWidth}
\newcommand{\myLengthThreeColumnsSeparatorWidth}{ {{- .Layout.Sizes.ThreeColumnsSeparatorSize -}} }
\newcommand{\myLengthThreeColumnWidth}{\dimexpr.333\linewidth-.667\myLengthThreeColumnsSeparatorWidth}


\begin{document}

{{ .Files }}

\end{document}`

const Title = "title"
const title = `\hspace{0pt}\vfil
\hfill\resizebox{.7\linewidth}{!}{ {{- .Title -}} }%
\pagebreak`

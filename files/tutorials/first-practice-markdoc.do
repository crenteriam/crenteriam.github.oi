cd "C:\Users\César\Desktop\test"
log close _all
* Begin Latex syntax

capture quietly log using MyLog, replace

/***
\documentclass{article}
\usepackage{graphicx,float}
\graphicspath{ {./} }
\begin{document}

***/
//OFF
* Load a File
sysuse auto
scatter mpg rep78
graph export plot1.png, replace
//ON
/***

Final paragraph of the article here. Next, insert a scatter plot. /par

\begin{figure}[H]
  \centering
  \includegraphics[width=8cm]{plot1.png}
  \caption{}
  \label{}
\end{figure}

\end{document}

***/

quietly log close
graph close _all
markdoc MyLog, export(latex) replace

*Compile and open the file in Windows
!pdflatex Mylog.tex
!explorer MyLog.pdf

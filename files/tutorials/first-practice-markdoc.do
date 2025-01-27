* For this practice Do-File, you will need to:
* (1) Change the working directory in line 6
* (2) Having installed a Latex Distribution
* (3) Having installed the markdoc packages (github, markdoc, statax, and weaver)

cd "C:\YOUR_WORKING_DIRECTORY"
log close _all
* Begin Latex syntax

capture quietly log using MyLog, replace

* BEGINNING OF LATEX DOCUMENT  -------------------------------------------------
/***
\documentclass{article}
\usepackage{graphicx}
\graphicspath{ {./} }
\begin{document}

***/
* Switch to Stata

* (1) Practice /**/ AND quietly  -----------------------------------------------

* The line below will only hide the programming line
/**/ display "markdoc is a literate programming package"

* The line below will only hide the output
quietly display "markdoc is a literate programming package"

* The line below will hide the programming line AND the output
/**/ quietly display "markdoc is a literate programming package"


* The command below will be recorded in the log file
sysuse auto

/***
% Switch to Latex

Below, see the descriptive statistics for two variables of the data set auto.
We are printing directly from stata both the programming line and the output.

\begin{verbatim}
***/
* Swtich to Stata

* (2) Practice verbatim -------------------------------------------------------
sysuse auto
summarize mpg price
/***
% Switch to Latex

\end{verbatim}

Finally, produce and print a Figure in Latex. The commands \verb|//OFF| and
\verb|//ON|, will hide both the programming line and the output.
***/
* Switch to Stata

* (3) Practice //OFF and // ON  ------------------------------------------------

//OFF
* everything typed below //OFF will be executed in the console
* but not recorded in the log file
scatter mpg price
graph export "graph1.png", replace
//ON

* After //ON, the lines below will be recorded in the log file
display "markdoc is a literate programming package"

/***
% Switch to Latex

Below, the graph produced from the hidden code chunk.

\begin{figure}[h!]
  \centering
  \includegraphics[width=8cm]{graph1.png}
  \caption{Title of the Figure}
\end{figure}

\end{document}
***/
* Switch to Stata

quietly log close
graph close _all
markdoc MyLog, export(latex) replace

* Only for Windows: compile and open the file
* If you are working in Mac, you will need to compile in your Latex/Text Editor
!pdflatex Mylog.tex
!explorer MyLog.pdf

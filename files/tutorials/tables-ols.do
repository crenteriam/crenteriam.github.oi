* Note: for printing the table in the pdf, we will switch back Latex on and off
*       with markdoc.

clear all
set more off
version 14
log close _all

cd "C:\Users\rente\OneDrive\Escritorio\wdir"
capture mkdir Tables
*ssc install estout
* markdoc packages here.

* BEGIN LATEX DOCUMENT  --------------------------------------------------------
quietly log using LogTableOLS, replace
/***
% Switch to Latex
\documentclass[12pt]{article}
\begin{document}
***/
* Switch to Stata
//OFF

sysuse auto  // Load data

* 1 Create a .tex tabular  -----------------------------------------------------

* First store the results in Stata's memory
  * Alternative 1, with built-in command "estimates store"
  reg price mpg
  estimates store Model1

  * Alternative 2, with estout command "eststo"
  eststo Model1: reg price mpg

* Then, export the resesults as a Latex tabular in a .tex file
esttab Model1 using ".\tables\Table1.tex", replace

* 2 Print the table in your document THE ESTOUT TABLE WAY  ---------------------------

* The estout table way (1/2)
* First, in Stata, do:

reg price mpg
estimates store Model1
esttab Model1 using ".\tables\Table1.tex", title("Title for the Figure" \label{tab:table1}) replace

//ON
/***
% Switch to Latex
\section{Printing Table with the \textit{estout table way}}

\input{./tables/Table1}

The Table \ref{tab:table1} shows that ...
***/
* Switch to Stata
//OFF

* 2 Print the table in your document THE LATEX TABLE WAY  ----------------------------
* The Latex table way (1/2)
* First, in Stata, do:

reg price mpg
estimates store Model1
esttab Model1 using ".\tables\Table1.tex", replace

//ON
/***
% Switch to Latex

\section{Printing Table with the \textit{Latex table way}}

\begin{table}[h]
\input{./tables/Table1}
\caption{Title for the Figure}
\label{tab:table2}
\end{table}

The Table \ref{tab:table2} shows that ...

\end{document}
***/
* Switch to Stata
/**/ quietly log close
markdoc LogTableOLS, markup(latex) export(tex) replace

* For Windows users, you can compile the pdf with the code below:
!pdflatex LogTableOLS.tex
!pdflatex LogTableOLS.tex
!pdflatex LogTableOLS.tex
!explorer LogTableOLS.pdf

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
quietly log using BasicTableOLS, replace
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

*eststo Model1a:reg price mpg
reg price mpg
estimates store Model1a
esttab Model1a using ".\tables\Table1a.tex", title("Title for the Figure" \label{tab:table1}) replace

//ON
/***
% Switch to Latex
\section{Printing Table with the \textit{estout table way}}

\input{./tables/Table1a}

The Table \ref{tab:table1} shows that ...
***/
* Switch to Stata
//OFF

* 2 Print the table in your document THE LATEX TABLE WAY  ----------------------------
* The Latex table way (1/2)
* First, in Stata, do:

reg price mpg
estimates store Model1b
esttab Model1 using ".\tables\Table1b.tex", replace

//ON
/***
% Switch to Latex

\section{Printing Table with the \textit{Latex table way}}

\begin{table}[h]
\centering
\input{./tables/Table1b}
\caption{Title for the Figure}
\label{tab:table2}
\end{table}

The Table \ref{tab:table2} shows that ...

\end{document}
***/
* Switch to Stata
/**/ quietly log close
markdoc BasicTableOLS, markup(latex) export(tex) replace

* For Windows users, you can compile the pdf with the code below:
!pdflatex BasicTableOLS.tex
!pdflatex BasicTableOLS.tex
!pdflatex BasicTableOLS.tex
!explorer BasicTableOLS.pdf

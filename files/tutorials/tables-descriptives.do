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
quietly log using LogTableDescriptivestats, replace
/***
% Switch to Latex
\documentclass[12pt]{article}
\begin{document}
***/
* Switch to Stata
//OFF
sysuse auto
estpost summarize mpg price weight
estimates store DescriptivesAuto
esttab DescriptivesAuto using ".\tables\Table1.tex", cell((mean() min() max())) replace

/***
% Switch to Latex
\begin{table}
\centering
\input{Table1}
\caption{Summary Statistics}
\end{table}
***/
* Switch to Stata
//OFF
esttab . using ".\report\Table1.tex", cell((mean() min() max())) nonumber nomtitle replace
//ON
/***
% Switch to Latex
\end{document}
***/
* Switch to Stata
/**/ quietly log close
markdoc LogTableDescriptivestats, markup(latex) export(tex) replace

* For Windows users, you can compile the pdf with the code below:
!pdflatex LogTableDescriptivestats.tex
!pdflatex LogTableDescriptivestats.tex
!pdflatex LogTableDescriptivestats.tex
!explorer LogTableDescriptivestats.pdf

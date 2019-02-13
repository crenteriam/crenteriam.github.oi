---
title: Display OLS Tables in your Latex Document
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---
| **Dynamic Documents with Stata.** Tools for Integrating Your Research Workflow |

<a name="Contents"></a>
[Teaching](../../../teaching) &rarr; [Dynamic Documents with Stata](../dynamicdocs-stata)  &rarr; [Tables](../tables) &rarr; Display OLS Tables in your Latex Document



Common problems:
- Extended options. Titling. (titling in estout and titling in laex) The problem of double tabular in estout.
- How can I define the number of decimals in my table?
- My table does not fit the page width. Textwidth. Tabularx.
- My table does not fit in one page. Longtables. Compress tables.

### Stata Packages for Tables

This is a short tutorial to create publishable tables from Stata. There are few options with  user-written packages. The ones you must know are \verb|outreg2| and \verb|estout|. The package \verb|outreg2| is probably most known and easier to learn and manage than \verb|estout|; however, is less flexible and less integrated with the \LaTeX\ environment. But you might find it more beneficial if you do not intend to intend to do statistical analysis ocasionally.

On the other hand, \verb|estout| is a more robust package that has a neat integration with \LaTeX. During the course we will rely on \verb|estout| to produce the tables for the assignments. This tutorial shows you how to create basic descriptive statistics and regression tables with \verb|estout|.

For further details on the packages, please refer to the full documentation of [estout](http://repec.sowi.unibe.ch/stata/estout/) and [outreg2](http://repec.org/bocode/o/outreg2.html).

Install the package with the command \verb|ssc install estout|. For this tutorial, we are going to use the built-in dataset auto. Load it with the line
\verb|sysuse auto|.

To make our publishable tables, we will need three packages. The first one is
\verb|estimates store|; this is a Stata's official command. Then, the command
\verb|estpost| will help us to create the Descriptive Statistics table, whereas
the command \verb|esttab| will help us to create the Regression tables.

### Regression Tables

To make a regression table, first run the regression model. In this case, we will
start with a bivariate model of mileages per hour on price.

```latex
\begin{Verbatim}[formatcom=\color{stata}]
sysuse auto
setwd "Your Working Directory Path" // See section of Workflow.
quietly reg price mpg weight
\end{Verbatim}
```


The results are stored in temporary memory. We must save the results with the
command \verb|estimates store|. To do that, type \verb|estimates store| and then
give the results a name (e.g. Model1).

```latex
\begin{Verbatim}[formatcom=\color{stata}]
estimates store Model1
\end{Verbatim}
```

Now, produce the .tex file for this table. Use the command \verb|esttab|. Then,
name the stored model you want to include in the table. In this case, we want our
stored \verb|Model1|. after the word \verb|using| name the file path and the file
name (if you are using a working directory, you only need the latter, as in the
example below). Include the option \verb|replace|.

```latex
\begin{Verbatim}[formatcom=\color{stata}]
esttab Model1 using ".\report\Table2.tex", replace
\end{Verbatim}
```

The .tex file containing the table must be created at this moment. To insert the
table in the document, follow the same process as with the descriptive statistics:

```latex
\begin{Verbatim}[formatcom=\color{latex}]
\begin{table}[H]
\centering
	\input{Table2}
\caption{Model 1. Price on MGP and Weight}
\end{table}
\end{Verbatim}
```

The Regression Table will be displayed as below:

![Display Table from Latex Here](Ancillary/Tables/04_01_Table2.tex)


### Multiple Models in one Table

Finally, we will expand the regression table. We will include more models and more
options. We will create a \verb|Model2|, which includes the independent variable
\verb|weight| and a \verb|Model3| which includes the independent variables \verb|weight| and \verb|foreign|. Save the results with \verb|estimates store| for each model:

```latex
\begin{Verbatim}[formatcom=\color{stata}]
quietly reg price mpg weight
estimates store Model2
quietly reg price mpg weight foreign
estimates store Model3
\end{Verbatim}
```

### Format Model Titles and Variable Labels

To create the \verb|.tex| file containing the table, we use again the command \verb|esttab|. Now, we will include our three models stored. We will also include the options \verb|nonumbers| (will take out the number in parenthesis from the headings row), \verb|label| (will use Stata's labels in the variable colums, see \ref{subsec:label}), and \verb|mtitles| (to name the results colums with our own titles). We also want to add the r-squared by including the option \verb|r2(2)| (the number 2 in parenthesis tells Stata to display two decimals). You can add a note with the option \veb|addnote|.

```latex
\begin{Verbatim}[formatcom=\color{stata}]
esttab Model1 Model2 Model3 using ".\report\Table3.tex", ///
       r2(2) replace label nonumbers ///
       mtitles("Model 1" "Model 2" "Model 3") ///
       addnote("This is a note.")
\end{Verbatim}
```

The new \verb|Table3.tex| file will produce this table:

\begin{table}[H]
\centering
	\input{Ancillary/Tables/04_01_Table3.tex}
\caption{Summary Statistics}
\end{table}

### Expand/Reduce Regression Information

\textbf{Additional statistics.} Yo can include more information on the regression table, such as F-statistic (\verb|F|, Adjusted R Squared \verb|ar2|, number of observations (\verb|N|), etc. (see \href{http://repec.sowi.unibe.ch/stata/estout/esttab.html}{esttab}). You can also add ad hoc estimations to the regression table (e.g. \href{http://personal.rhul.ac.uk/uhte/006/ec5040/chow\%20test.pdf}{Chow test}, see \href{http://repec.sowi.unibe.ch/stata/estout/estadd.html}{estadd}).

\vspace{4mm} \noindent
\textbf{Selected independent variables (keep and drop).}

\vspace{4mm} \noindent
\textbf{Parameter statistics (stars, t-statistic, s.e., etc.)} se conf interv, p-value, t-statistic, stars.

\vspace{4mm} \noindent
\textbf{Number of decimals displayed.}

This section presented Stata's commands to edit the output to be presented in the regression table. Complementary \LaTeX\ commands might be needed to fit the table in the PDF. See Section \ref{tables_personalized}

Here is a \href{TBD}{link to the do-file to run the examples above.}

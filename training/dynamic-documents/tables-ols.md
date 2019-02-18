---
title: Display OLS Tables in Latex Documents
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---

<a name="Contents"></a>
<p style="text-align: center;">
<a href="https://crenteriam.github.io/training/dynamic-documents/dynamicdocs-stata/">Dynamic Documents with Stata</a>
</p>
<p style="text-align: center;">
Tables &rarr; - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-stata/">Latex Table in Stata</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-latex/">Latex Syntax</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-descriptives/">Descriptive Stats</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-personalized/">Personalized</a>
</p>



Common problems:
- Extended options. Titling. (titling in estout and titling in laex) The problem of double tabular in estout.
- How can I define the number of decimals in my table?
- My table does not fit the page width. Textwidth. Tabularx.
- My table does not fit in one page. Longtables. Compress tables.

### Multiple Models in one Table

Finally, we will expand the regression table. We will include more models and more options. We will create a `Model2`, which includes the independent variable `weight` and a `Model3` which includes the independent variables `weight` and `foreign`. Save the results with `estimates store` for each model:

```stata
quietly reg price mpg weight
estimates store Model2
quietly reg price mpg weight foreign
estimates store Model3
```
### Format Model Titles and Variable Labels

To create the `.tex` file containing the table, we use again the command `esttab`. Now, we will include our three models stored. We will also include the options `nonumbers` (will take out the number in parenthesis from the headings row), `label` (will use Stata's labels in the variable colums, see [link to label subsection here](), and `mtitles` (to name the results colums with our own titles). We also want to add the r-squared by including the option `r2(2)` (the number 2 in parenthesis tells Stata to display two decimals). You can add a note with the option `addnote`.

```stata
esttab Model1 Model2 Model3 using ".\report\Table3.tex", ///
       r2(2) replace label nonumbers ///
       mtitles("Model 1" "Model 2" "Model 3") ///
       addnote("This is a note.")
```

The new `Table3.tex` file will produce this table:

![Summary Statistics](Ancillary/Tables/04_01_Table3.tex)

### Expand/Reduce Regression Information

**Additional statistics.** Yo can include more information on the regression table, such as F-statistic (`F`, Adjusted R Squared `ar2`, number of observations (`N`), etc. (see [esttab](http://repec.sowi.unibe.ch/stata/estout/esttab.html)). You can also add ad hoc estimations to the regression table (e.g. [Chow test](http://personal.rhul.ac.uk/uhte/006/ec5040/chow\%20test.pdf), [estadd](http://repec.sowi.unibe.ch/stata/estout/estadd.html)).

```latex
\vspace{4mm} \noindent
\textbf{Selected independent variables (keep and drop).}
\vspace{4mm} \noindent
\textbf{Parameter statistics (stars, t-statistic, s.e., etc.)} se conf interv, p-value, t-statistic, stars.
\vspace{4mm} \noindent
\textbf{Number of decimals displayed.}
```

This section presented Stata's commands to edit the output to be presented in the regression table. Complementary Latex commands might be needed to fit the table in the PDF. See Section [Personalized Tables](tables-personalized.md).

Finally, we will expand the regression table. We will include more models and more
options. We will create a \verb|Model2|, which includes the independent variable
\verb|weight| and a \verb|Model3| which includes the independent variables
\verb|weight| and \verb|foreign|. Save the results with \verb|estimates store|
for each model:
\begin{verbatim}
***/
quietly reg price mpg weight
estimates store Model2
quietly reg price mpg weight foreign
estimates store Model3
/***
\end{verbatim}

To create the .tex file containing the table, we use again the command \verb|esttab|.
Now, we will include our three models stored. We will also include the options
\verb|nonumbers| (will take out the number from the heading row), \verb|label|
(will use Stata's labels in the variable colums), and \verb|mtitles| (to name
the results colums with our own titles). We also want to add the r-squared by
including the option \verb|r2(2)|.
\begin{verbatim}
***/
esttab Model1 Model2 Model3 using ".\report\Table3.tex", ///
r2(2) replace label nonumbers mtitles("Model 1" "Model 2" "Model 3")
/***
\end{verbatim}

The new \verb|Table3.tex| file will produce this table:

\begin{table}[H]
\centering
	\input{Table3}
\caption{Summary Statistics}
\end{table}

Here is a [link to the do-file to run the examples above.](TBD).

http://repec.org/bocode/e/estout/hlp_esttab.html

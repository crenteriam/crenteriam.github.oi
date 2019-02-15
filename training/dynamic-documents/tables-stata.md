---
title: Tables
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---
| [**Dynamic Documents with Stata.**](dynamicdocs-stata.md) Tools for Integrating Your Research Workflow |

<a name="Contents"></a>
<p style="text-align: center;">
 <a href="#">Previous section</a> &larr; Tables &rarr; <a href="#">Next section</a>
</p>

| Jump to sub-sections: |
| [Descriptive Statistics Tables](tables-descriptives.md) |
| [Regression Tables](tables-ols.d)   |
| [Personalized Tables](tables-personalized.md)  |

### Introduction
1. Creating the Table in stata
2. Storing the table in your workind directory
3. Linking the Table in Latex
4. Basic editing of tables in Latex

### Creating the Table in Stata

To create Latex tables in Stata you must install the user-written packages `estout` or `outreg2`. The package `outreg2` has an easier markup syntax than `estuout`, and therefore easier to learn and use. However, `outreg` is a more robust package that has a neat integration with Latex formatting features. In this chapter, we will rely on `estout` to produce publishable tables in Latex. (For further details, see the full documentations of [estout](http://repec.sowi.unibe.ch/stata/estout/) and [outreg](http://repec.org/bocode/o/outreg2.html)).


[Up](#Contents)

### Getting Started

Install the package with the command line `ssc install estout`. Now, open the dataset *auto* with `sysuse auto`. To produce the Latex table in Stata, we will need three commands. First, `estimates store`, is a Stata's official command to store your regression results. Then, you need to print these results through `outreg` commands. For descriptive statistics, you must use the command `estpost`, whereas the command `esttab` will print regression results.

### Create Descriptive Statistics in stata

First load the *auto* data. Then use `estpost` and `summarize` to print a summary statistics table.

```Stata
sysuse auto
quietly estpost summarize mpg price weight
```

Then use `estimates store` to save the table you just have printed, and give it a name (say `descriptivesauto`).

Then, use the command `esttab` to save the table as a Latex file. In this case, I named it Table1.tex and stored it within the folder report in my working directory. (don't worry about the options now). See below:

```stata
estimates store descriptivesauto
esttab descriptivesauto using ".\report\Table1.tex", cell((mean() min() max())) nonumber nomtitle replace
```

Now, you should have a .tex file in your folder. This is all you need to do in Stata for descriptive statistics. (but see below for editing options). This is the file you will need to call in your Dynamic document.

### Create Regression Tables in Stata

To make a regression table, first run the regression model. In this case, we will start with a bivariate model of mileages per hour on price.

The results are stored in temporary memory. We must save the results with the
command `estimates store`. To do that, type `estimates store` and then
give the results a name (e.g. Model1).

```stata
quietly reg price mpg weight
estimates store Model1
```

Now, produce the .tex file for this table. Use the command `esttab`. Then,
name the stored model you want to include in the table. In this case, we want our
stored `Model1`. after the word `using` name the file path and the file
name (if you are using a working directory, you only need the latter, as in the
example below). Include the option `replace`.

```stata
esttab Model1 using ".\report\Table2.tex", replace
```

The .tex file containing the table must be created at this moment.




% NEXT STEPS -------------------------------------------------------------------
\section{Extra functions}

\begin{itemize}
\item What is \href{https://www.sharelatex.com/learn/Positioning_of_Figures}{the [H]}
symbol that appears besides the command "begin table"?

\item To manipulate the table numeration use the package
\href{https://tex.stackexchange.com/questions/28392/how-to-suppress-caption-numbering-in-a-table}{caption}

\item For more fine-grained manipulation of estout tables, see
\href{https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm#summary}{this documentation}.

\item To use labels in Stata see \href{https://www.stata.com/manuals13/gsw9.pdf}{here}
(it's better is you do this in the data management do-file).

\item You can check out the companion do-file of this document on blackboard.

\item My table doesn't fit the page. How can I
\href{https://tex.stackexchange.com/questions/10535/how-to-force-a-table-into-page-width}{solve it}?
\end{itemize}

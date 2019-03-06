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

### Basic OLS Table

By using the data set `auto` (so you ca replicate in any computer), we will create a basic OLS table with `estout`. This task requires two steps. The first step is creating a `.tex` file **within Stata** that contains the table in Latex markup language. The second step is to print the `.tex` table within Latex.

<u>Step 1</u>

Run your regression and store your results. To store the regression results, you can use the command `estimates store` and then name the results. In this case, I used the name Model1. Alternatively, you can use the `estout` command `eststo`. Whatever fits you better.

```stata
* Alternative 1, with built-in command "estimates store"
reg price mpg
estimates store Model1

* Alternative 2, with estout command "eststo"
eststo Model1: reg price mpg
```
Now, we are going to use the results stored in `Model1` to create a `.tex` file that will contain the formatted regression table. To do so, we need the command `esttab`, then type Model1 (where the results are stored) followed by `using` and the file path and file name. In the example below, we stored the `.tex` file with the name `Table1` in the folder tables. (Don't forget the option replace).

```stata
esttab Model1 using ".\tables\Table1.tex", replace
```
<u>Step 2:</u>

The step 1 produced the table and saved it as a `.tex` file, but will not print it in the document. To do so, you need to call the `Table1.tex` file within your Latex document. In Latex, the command `\input{}` runs another `.tex` file within a `.tex` file, just like the Stata commands `do`, `run` or `include` run another Do-File within your Do-File.

As the `Table1.tex` is created in the chunk above creates a ***tabular*** evironment, not a ***table*** environment. You want to print a ***table*** environment in your Latex file. This is where the step 2 **becomes tricky** because you can do that in two ways. Let's call them the *estout table way* and the *latex table way*, and look at them in detail.

*Note: before going further, we will assume that you know the differences between the tabular and table environments, which were explained in the section xxx*

```stata
* The estout table way (1/2)
reg price mpg
estimates store Model1
esttab Model1 using ".\tables\Table1.tex", title("Title for the Figure" \label{tab:table1}) replace
```

```latex
% The estout table way (2/2)
\input{Table1}
```

```stata
* The Latex table way (1/2)
reg price mpg
estimates store Model1
esttab Model1 using ".\tables\Table1.tex", replace
```

```latex
% The Latex table way (2/2)
\begin{table}[h]
\input{Table1}
\caption{Title for the Figure}
\label{tab:table1}
\end{table}
```

### Multiple models in one table
### Basic layout editing

Common problems:
- Extended options. Titling. (titling in estout and titling in laex) The problem of double tabular in estout.
- How can I define the number of decimals in my table?
- My table does not fit the page width. Textwidth. Tabularx.
- My table does not fit in one page. Longtables. Compress tables.

### Multiple Models in one Table

Finally, we will expand the regression table. We will include more models and more options. We will create a `Model2`, which includes the independent variable `weight` and a `Model3` which includes the independent variables `weight` and `foreign`. Save the results with `estimates store` for each model:

```stata
reg price mpg weight
estimates store Model2
reg price mpg weight foreign
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

todo:
- how to display fewer independent variables (keep and drop)
- how to select parameter statistics for display (stars, t-statistic, s.e., -- se conf interv, p-value, t-statistic, stars.)
- define number of decimals printed.

This section presented Stata's commands to edit the output to be presented in the regression table. Complementary Latex commands might be needed to fit the table in the PDF. See Section [Personalized Tables](tables-personalized.md).

Finally, we will expand the regression table. We will include more models and more options. We will create a `Model2`, which includes the independent variable `weight` and a `Model3` which includes the independent variables `weight` and `foreign`. Save the results with `estimates store` for each model:

```latex
***/
quietly reg price mpg weight
estimates store Model2
quietly reg price mpg weight foreign
estimates store Model3
/***
```

To create the `.tex` file containing the table, we use again the command `esttab`. Now, we will include our three models stored. We will also include the options
`nonumbers` (will take out the number from the heading row), `label` (will use Stata's labels in the variable colums), and `mtitles` (to name the results colums with our own titles). We also want to add the r-squared by including the option `r2(2)`.

```latex
***/
esttab Model1 Model2 Model3 using ".\report\Table3.tex", ///
r2(2) replace label nonumbers mtitles("Model 1" "Model 2" "Model 3")
/***
```

The new `Table3.tex` file will produce this table:

```latex
\begin{table}[H]
\centering
	\input{Table3}
\caption{Summary Statistics}
\end{table}
```

Download the [practice Do-File on Tables OLS](https://crenteriam.github.io/files/tutorials/tables-ols.do).

http://repec.org/bocode/e/estout/hlp_esttab.html

[Up](#Contents)

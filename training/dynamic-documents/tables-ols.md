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
* First, in Stata, do:
reg price mpg
estimates store Model1
esttab Model1 using ".\tables\Table1.tex", title("Title for the Figure" \label{tab:table1}) replace
```

```latex
% The estout table way (2/2)
% Then, in Latex, do:
\input{Table1}
```

```stata
* The Latex table way (1/2)
* First, in Stata, do:
reg price mpg
estimates store Model1
esttab Model1 using ".\tables\Table1.tex", replace
```

```latex
% The Latex table way (2/2)
% Then, in Latex, do:
\begin{table}[h]
\input{Table1}
\caption{Title for the Figure}
\label{tab:table1}
\end{table}
```

### Multiple models in one table

Let'c create a table with multiple models. First, run each model and store the resulsts with `estimates store`.

```stata
* Model 1
reg price mpg
estimates store Model1

* Model2
reg price mpg weight
estimates store Model2

* Model 3
reg price mpg weight foreign
estimates store Model3
```

Now, place all the three models stored `Model1`, `Model2` and `Model3` as shown in the chunk below. In the option `mtitles()` title each of your models, the option `nonumbers` will get rid of the model numeration above the titles (if needed), and `r2(2)` will print the R2 squared with two decimal digits. The output of the code below will produce a ***tabular***, not a ***table***. Then you have to choose either the *estout table way* or the *latex table way* to complete the step 2.

```stata
esttab Model1 Model2 Model3 using "\tables\Table3.tex", mtitles("Model 1" "Model 2" "Model 3") r2(2) nonumbers replace
```

The new `Table3.tex` file will produce this table:

![OLS Table](image)

### Tabular environment formatting within `estout`

- **label**. The tables will print the name of the variable by default (e.g. *mpg*), but you may want to print a publishable mane for the variable, for example, *Mileage per Gallon*. The `estout` package is fully compatible with the Stata's `label variable` command.[^1] To print labels, you need to label all the variables (we racommend you to do this in the *data_management.do* file), and then use the option `label` when running the command `estpost` for descriptives or `esttab` for regressions.
- **nonumbers**. Avoids printing the regression number in the tabular header. For descriptive statistics tables, do not print column number in the table header.
- **nomtitle**. Disable the model titles, or the column titles.
- **mtitles()**. Specify a title for the model.
- **depvars/nodepvars**. Use/do not use use dependent variables as model titles. (the default is depvars).
- **addnote()**. Add a note beneath the tabular.
- **Regression Statistics**. Yo can include more information on the regression table, such as F-statistic (`F`, Adjusted R Squared `ar2`, number of observations (`N`), etc. (see [esttab](http://repec.sowi.unibe.ch/stata/estout/esttab.html) for more options). You can also add personalized estimations to the regression table (e.g. [Chow test](http://personal.rhul.ac.uk/uhte/006/ec5040/chow\%20test.pdf)) with the command [estadd](http://repec.sowi.unibe.ch/stata/estout/estadd.html).
- **Hide independent variables**.
- **Choose parameters to be displayed**. (stars, t-statistic, s.e., -- se conf interv, p-value, t-statistic, stars.)
- **Number of decimals printed**.

Example <u>without</u> any estout options:

![Print table]()

Example <u>with</u> the estout options `label` `nonumbers`, `nomtitle`, `addnote()`:

```stata
esttab DescriptivesAuto using ".\tables\Table2.tex", label nonumbers nomtitle addnote("This is a note.") replace
```
![Print table]()

[Up](#Contents)

### Table environment formatting within `estout`

*Note: these options substantially change the nature of your table in Latex; they become table and not tabular environments. You must read the section [Syntax for Tables in Latex](tables-latex.md) before using any of these.*

- **title()**. Specify a title for your table.
- **addnotes()**. Add notes to your table.
- **longtable**. Use the option longable when your table is too long to fit in one page. - - The ***longtable*** environment. Replaces the **table** environment, not the ***tabular***. This  option also requires you to use the Latex package longtable.



- NOTE:  My table does not fit the page width. Textwidth. Tabularx.
- NOTE: My table does not fit in one page. Longtables. Compress tables.

Download the [practice Do-File on Tables OLS](https://crenteriam.github.io/files/tutorials/tables-ols.do).

This section presented Stata's commands to edit the output to be presented in the regression table. Complementary Latex commands might be needed to fit the table in the PDF. See Section [Personalized Tables](tables-personalized.md).

[helpesttab](http://repec.org/bocode/e/estout/hlp_esttab.html)

[Up](#Contents)

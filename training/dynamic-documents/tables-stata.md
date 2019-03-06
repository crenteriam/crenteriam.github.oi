---
title: Creating a Latex table in Stata
layout: contents
tag: tables, latex, stata, research reproducibility, estout, webdoc, outreg2
---

<a name="Contents"></a>
<p style="text-align: center;">
<a href="https://crenteriam.github.io/training/dynamic-documents/dynamicdocs-stata/">Dynamic Documents with Stata</a>
</p>
<p style="text-align: center;">
Tables &rarr; <a href="https://crenteriam.github.io/training/dynamic-documents/tables-latex/">Latex Syntax</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-descriptives/">Descriptive Stats</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-ols/">Regression</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-personalized/">Personalized</a>
</p>

Download an [example Do-File](TBD) of this section.

### Introduction
In this section, we will provide information to create, and store tables in Stata in Latex format. We will create a `.tex` file containing a table to be placed in your Dynamic Document. We will also present some basic Latex layout editing that you should do within Stata before importing the .tex file in your Dynamic Document.

To create Latex tables in Stata you must install the user-written packages `estout` or `outreg2`. The package `outreg2` has an easier markup syntax than `estuout`, and therefore easier to learn and use. However, `outreg` is more robust and has a neat integration with Latex formatting features. In this chapter, <u>we will only use</u> `estout` to produce publishable tables in Latex. (For further details, see the full documentations of [estout](http://repec.sowi.unibe.ch/stata/estout/) and [outreg](http://repec.org/bocode/o/outreg2.html)). If you want to integrate Stata with Markdown, instead of `estout`, you will need to use the package `webdoc`. This book, however, is only dedicated to creating Dynamic Documents in Latex. If you want to create Dynamic Documents in Markdown, we recommend you to find tutorials in this [website](http://repec.sowi.unibe.ch/stata/webdoc/index.html).

### Getting started

Install the package with the command line `ssc install estout`. Now, open the dataset *auto* with `sysuse auto`. To produce the Latex table in Stata, we will need three commands. First, `estimates store`, which is a command to store regression results. Then, we will need to print these results by using the `outreg` package. For descriptive statistics, we must use the command `estpost`, whereas the command `esttab` will print regression results.

### Create a descriptive statistics table

First load the *auto* data. Then use `estpost` and `summarize` to print a summary statistics table.

```stata
sysuse auto
estpost summarize mpg price weight
```

Then use `estimates store` to save the table you just have printed, and give it a name (we will name it `DescriptivesAuto`).

Then, use the command `esttab` to save the table as a Latex file. In this case, I named it `Table1.tex` and stored it within the folder report in my working directory. (don't worry about the options now). Finally, the option `cell((mean() min() max()))` is telling Stata to print the mean in the first column, the minimum in the second, and the maximum in the third. See below:

```stata
estimates store DescriptivesAuto
esttab DescriptivesAuto using ".\report\Table1.tex", cell((mean() min() max()))
```

Now, you should have a `.tex` file in your `report` folder. This is all we need to do in Stata for getting the descriptive statistics table in Latex format for the Dynamic Document. However, this is a basic table, and further editing in Stata may be needed for a fully publishable table.

[Up](#Contents)

### Create a regression table

For the regression table, let's first run the regression `reg price mpg weight`. Then, let's save the results as `Model1`:

```stata
reg price mpg weight
estimates store Model1
```

Now, to produce a basic table with Latex format, use the command `esttab`. Then call the results stored as `Model1` and then specify the file path where you want to save the `.tex` file (and don't forget the option `replace`):

```stata
esttab Model1 using ".\report\Table2.tex", replace
```

Now, you should have a `Table2.tex` file in your `report` folder. Your regression table is ready to be used in your Dynamic Document. Note, however, that the table created out of this basic example is not a ***table*** environment, but a ***tabular*** environment. This means that you will have to define the ***table*** environment in Latex, and all the ***table*** features (e.g., table title, table positioning, and the reference key).

![Table from above](TBD)

[Up](#Contents)

### Basic Table Formatting within `estout`

**label** The tables will print the name of the variable by default (e.g. *mpg*), but you may want to print a publishable mane for the variable, for example, *Mileage per Gallon*. The `estout` tables are fully compatible with the `label variable` command.[^1] To print labels, you need to label all the variables (we racommend you to do this in the *data_management.do* file), and then use the option `label` when running the command `esttab` for descriptives or `estpost` for regressions

```stata
esttab Model1 using ".\report\Table2.tex", replace label
```

**nonumbers** For regression tables, do not print model numbers in the table header. For descriptive statistics tables, do not print column number in the table header.
**nomtitle** Disable the model titles, or the column titles.

```stata
esttab Model1 using ".\report\Table2.tex", replace label nonnumbers nomtitle
```

**mtitles** Specify a title for the model.
**depvars/nodepvars** use/do not use use dependent variables as model titles.

 # Table Environment
**title()** Specify a title for your table.
**addnotes()** Add notes to your table.

**longtable** Use the option longable when your table is too long to fit in one page. The ***longtable*** environment replaces the **table** environment, not the ***tabular***. This  option also requires you to use the Latex package longtable.

Example <u>without</u> the estout options `label` `nonumbers` nor `nomtitle`:

```stata
```

![Print table]()

Example <u>with</u> the estout options `label` `nonumbers` nor `nomtitle`:

```stata
```
![Print table]()

Complementary Readings:
- Ben Jann, [Making regression tables from stored estimates](http://www.soz.unibe.ch/unibe/portal/fak_wiso/c_dep_sowi/inst_soz/content/e39893/e48983/e131227/e131228/e131246/e131269/estout_ger.pdf).
- Check out [this website](https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm#summary) for further tutorials on using estout in Stata.

[Making Regression Tables from Stored Estimates](http://www.soz.unibe.ch/unibe/portal/fak_wiso/c_dep_sowi/inst_soz/content/e39893/e48983/e131227/e131228/e131246/e131269/estout_ger.pdf)

Download the [practice Do-File on Tables from Stata](https://crenteriam.github.io/files/tutorials/tables-stata.do).

[Up](#Contents)

- table as separate file, and then use input. show some screens with this. Also helps bc R and Stata will provide table as separate file.

[^1]: Check out the Stata's [labeling variable](https://www.stata.com/manuals13/gsw9.pdf) documentation for further details.

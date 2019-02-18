---
title: Creating a Latex table in Stata
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
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
In this section, we will provide information to create, and store tables in Stata in Latex format. We will create a .tex file that you will import in your Dynamic Document We will also present some basic Latex layout editing that you should do within Stata before importing the .tex file in your Dynamic Document.

To create Latex tables in Stata you must install the user-written packages `estout` or `outreg2`. The package `outreg2` has an easier markup syntax than `estuout`, and therefore easier to learn and use. However, `outreg` is more robust and has a neat integration with Latex formatting features. In this chapter, <u>we will only use `estout` to produce publishable tables in Latex.</u> (For further details, see the full documentations of [estout](http://repec.sowi.unibe.ch/stata/estout/) and [outreg](http://repec.org/bocode/o/outreg2.html)). If you want to integrate Stata with Markdown, instead of `estout`, you will need to use [webdoc](http://repec.sowi.unibe.ch/stata/webdoc/index.html).

### Getting started

Install the package with the command line `ssc install estout`. Now, open the dataset *auto* with `sysuse auto`. To produce the Latex table in Stata, we will need three commands. First, `estimates store`, is a Stata's official command to store your regression results. Then, you need to print these results through `outreg` commands. For descriptive statistics, you must use the command `estpost`, whereas the command `esttab` will print regression results.

Check out [this website](https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm#summary) for further tutorials on using estout in Stata.

### Create a descriptive statistics table

First load the *auto* data. Then use `estpost` and `summarize` to print a summary statistics table.

```Stata
sysuse auto
estpost summarize mpg price weight
```

Then use `estimates store` to save the table you just have printed, and give it a name (we will name it `DescriptivesAuto`).

Then, use the command `esttab` to save the table as a Latex file. In this case, I named it `Table1.tex` and stored it within the folder report in my working directory. (don't worry about the options now). See below:

```stata
estimates store DescriptivesAuto
esttab descriptivesauto using ".\report\Table1.tex", cell((mean() min() max()))
```

Now, you should have a `.tex` file in your folder. This is all you need to do in Stata for descriptive statistics. (but see below for editing options). This is the file you will need to call in your Dynamic document.

[Up](#Contents)

### Create a regression table

To make a regression table, first run the regression model. In this case, we will start with a bivariate model of mileages per hour on price.

The results are stored in temporary memory. We must save the results with the
command `estimates store` and give the results a name. Below, we named the results `Model1`.

```stata
reg price mpg weight
estimates store Model1
```

Now, produce the `.tex` file for this table. Use the command `esttab`. Then,
name the stored model you want to include in the table. In this case, we want our
stored `Model1`. after the word `using` name the file path and the file
name (if you are using a working directory, you only need the latter, as in the
example below). Include the option `replace`.

```stata
esttab Model1 using ".\report\Table2.tex", replace
```

The `.tex` file containing the table must be created at this moment. This table is only a ***tabular*** environment.

![Table from above](TBD)

[Up](#Contents)

### Main formatting options in `estout`

**label** The tables will print the name of the variable by default (e.g. *mpg*), but you may want to print a publishable mane for the variable, for example, *Mileage per Gallon*. The `estout` tables are fully compatible with the `label variable` command.[^1] To print labels, you need to label all the variables (we racommend you to do this in the *data_management.do* file), and then use the option `label` when running the command `esttab` for descriptives or `estpost` for regressions

**nonumbers** Do not print model numbers in the table header.
**nomtitle** nomtitles          disable model titles
**mtitles** Specify a title for the moodel.
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

[Up](#Contents)

[^1]: Check out the Stata's [labeling variable](https://www.stata.com/manuals13/gsw9.pdf) documentation for further details.

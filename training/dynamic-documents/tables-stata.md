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

Then, use the command `esttab` to save the table as a Latex file. In this case, I named it `Table1.tex` and stored it within the folder report in my working directory. (don't worry about the options now). Finally, you must specify the descriptive statistics to be printed in the table. To do so, use the option `cell()` and insert the descriptives needed within the parenthesis (it must have double parenthesis to be displayed in separate columns and not stacked in one column). See below:

```stata
estimates store DescriptivesAuto
esttab DescriptivesAuto using ".\tables\Table1.tex", cell((mean() min() max())) replace
```

Now, you should have a `.tex` file in your `tables` folder. This is all we need to do in Stata for getting the descriptive statistics table in Latex format for the Dynamic Document. However, this is a basic table, and further editing in Stata may be needed for a fully publishable table.

[Up](#Contents)

### Tabular environment formatting within `estout`

- **label**. The tables will print the name of the variable by default (e.g. *mpg*), but you may want to print a publishable mane for the variable, for example, *Mileage per Gallon*. The `estout` tables are fully compatible with the `label variable` command.[^1] To print labels, you need to label all the variables (we racommend you to do this in the *data_management.do* file), and then use the option `label` when running the command `estpost` for descriptives or `esttab` for regressions.
- **nonumbers**. For regression tables, do not print model numbers in the table header. For descriptive statistics tables, do not print column number in the table header.
- **nomtitle**. Disable the model titles, or the column titles.
- **mtitles**. Specify a title for the model.
- **depvars/nodepvars**. use/do not use use dependent variables as model titles.

Example <u>without</u> the estout options `label` `nonumbers` nor `nomtitle`:

![Print table]()

Example <u>with</u> the estout options `label` `nonumbers` nor `nomtitle`:

```stata
esttab DescriptivesAuto using ".\tables\Table2.tex", label nonnumbers nomtitle replace
```
![Print table]()

[Up](#Contents)

### Table environment formatting within `estout`

*Note: these options substantially change the nature of your table in Latex; they become table and not tabular environments. You must read the section [Syntax for Tables in Latex](tables-latex.md) before using any of these.*

- **title()**. Specify a title for your table.
- **addnotes()**. Add notes to your table.
- **longtable**. Use the option longable when your table is too long to fit in one page. - - The ***longtable*** environment. Replaces the **table** environment, not the ***tabular***. This  option also requires you to use the Latex package longtable.

Download the [practice Do-File on Tables from Stata](https://crenteriam.github.io/files/tutorials/tables-stata.do).

<u>Further readings on table formatting:</u>
- Ben Jann, [Making regression tables from stored estimates](http://www.soz.unibe.ch/unibe/portal/fak_wiso/c_dep_sowi/inst_soz/content/e39893/e48983/e131227/e131228/e131246/e131269/estout_ger.pdf).
- Check out [this website](https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm#summary) for further tutorials on using estout in Stata.
- [Making Regression Tables from Stored Estimates](http://www.soz.unibe.ch/unibe/portal/fak_wiso/c_dep_sowi/inst_soz/content/e39893/e48983/e131227/e131228/e131246/e131269/estout_ger.pdf)

[Up](#Contents)

- table as separate file, and then use input. show some screens with this. Also helps bc R and Stata will provide table as separate file.

[^1]: Check out the Stata's [labeling variable](https://www.stata.com/manuals13/gsw9.pdf) documentation for further details.

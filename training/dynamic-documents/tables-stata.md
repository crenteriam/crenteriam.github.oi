---
title: Creating a Latex table in Stata
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---

<a name="Contents"></a>
<p style="text-align: center;">
<a href="#">Dynamic Documents with Stata</a>
</p>
<p style="text-align: center;">
Tables &rarr; <a href="#">Latex Syntax</a> - <a href="#">Descriptive Stats</a> - <a href="#">Regression</a> - <a href="#">Personalized</a>
</p>


### Introduction
In this section, we will provide information to create, and store tables in Stata in Latex format. We will create a .tex file that you will import in your Dynamic Document We will also present some basic Latex layout editing that you should do within Stata before importing the .tex file in your Dynamic Document.

To create Latex tables in Stata you must install the user-written packages `estout` or `outreg2.` The package `outreg2` has an easier markup syntax than `estuout,` and therefore easier to learn and use. However, `outreg` is more robust and has a neat integration with Latex formatting features. In this chapter, we will rely on `estout` to produce publishable tables in Latex. (For further details, see the full documentations of [estout](http://repec.sowi.unibe.ch/stata/estout/) and [outreg](http://repec.org/bocode/o/outreg2.html)).

### Getting started

Install the package with the command line `ssc install estout`. Now, open the dataset *auto* with `sysuse auto`. To produce the Latex table in Stata, we will need three commands. First, `estimates store`, is a Stata's official command to store your regression results. Then, you need to print these results through `outreg` commands. For descriptive statistics, you must use the command `estpost`, whereas the command `esttab` will print regression results.

Check out [this website](https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm#summary) for further tutorials on using estout in Stata.

### Create a descriptive statistics table

First load the *auto* data. Then use `estpost` and `summarize` to print a summary statistics table.

```Stata
sysuse auto
quietly estpost summarize mpg price weight
```

Then use `estimates store` to save the table you just have printed, and give it a name (say `descriptivesauto`).

Then, use the command `esttab` to save the table as a Latex file. In this case, I named it `Table1.tex` and stored it within the folder report in my working directory. (don't worry about the options now). See below:

```stata
estimates store descriptivesauto
esttab descriptivesauto using ".\report\Table1.tex", cell((mean() min() max())) nonumber nomtitle replace
```

Now, you should have a `.tex` file in your folder. This is all you need to do in Stata for descriptive statistics. (but see below for editing options). This is the file you will need to call in your Dynamic document.

[Up](#Contents)

### Create a regression table

To make a regression table, first run the regression model. In this case, we will start with a bivariate model of mileages per hour on price.

The results are stored in temporary memory. We must save the results with the
command `estimates store`. To do that, type `estimates store` and then
give the results a name (e.g. Model1).

```stata
quietly reg price mpg weight
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

The `.tex` file containing the table must be created at this moment.

[Up](#Contents)

### Main formatting options in `estout`

**label** The tables will print the name of the variable by default (e.g. *mpg*), but you may want to print a publishable mane for the variable, for example, *Mileage per Gallon*. The `estout` tables are fully compatible with the `label variable` command.[^1] To print labels, you need to label all the variables (we racommend you to do this in the *data_management.do* file), and then use the option `label` when running the command `esttab` for descriptives or `estpost` for regressions

**nonumbers**

**nomtitle**

Example <u>without</u> the estout options `label` `nonumbers` nor `nomtitle`:

```stata
```

![Print table]()

Example <u>with</u> the estout options `label` `nonumbers` nor `nomtitle`:

```stata
```
![Print table]()

[Up](#Contents)

[^1]: Check out the Stata's [labeling variable](https://www.stata.com/manuals13/gsw9.pdf) documentation for further details.

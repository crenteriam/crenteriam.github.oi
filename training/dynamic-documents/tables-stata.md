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

Download the [practice Do-File on Tables from Stata](https://crenteriam.github.io/files/tutorials/tables-stata.do).

<u>Further readings about table formatting:</u>
- Ben Jann, [Making regression tables from stored estimates](http://www.soz.unibe.ch/unibe/portal/fak_wiso/c_dep_sowi/inst_soz/content/e39893/e48983/e131227/e131228/e131246/e131269/estout_ger.pdf).
- Check out [this website](https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm#summary) for further tutorials on using estout in Stata.
- [Making Regression Tables from Stored Estimates](http://www.soz.unibe.ch/unibe/portal/fak_wiso/c_dep_sowi/inst_soz/content/e39893/e48983/e131227/e131228/e131246/e131269/estout_ger.pdf)

[Up](#Contents)

- table as separate file, and then use input. show some screens with this. Also helps bc R and Stata will provide table as separate file.

[^1]: Check out the Stata's [labeling variable](https://www.stata.com/manuals13/gsw9.pdf) documentation for further details.

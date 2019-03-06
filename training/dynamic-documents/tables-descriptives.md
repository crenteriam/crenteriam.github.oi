---
title: Display Descriptive Statistics Tables in Latex Documents
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---

<a name="Contents"></a>
<p style="text-align: center;">
<a href="https://crenteriam.github.io/training/dynamic-documents/dynamicdocs-stata/">Dynamic Documents with Stata</a>
</p>
<p style="text-align: center;">
Tables &rarr; - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-stata/">Latex Table in Stata</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-latex/">Latex Syntax</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-ols/">Regression</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-personalized/">Personalized</a>
</p>

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

This command produces the descriptive statistics table. Now, we need to export it as a .tex file. To do that, we will use the command `esttab`. In the command chunk below you will notice a dot after `esttab`. As shown in the section [tables ols](TBD), esttab is used by calling an object stored (either with `estimates store` or `eststo`). But in this case, we will use what Stata has in memory after running `estpost sum mpg price weight`. The dot means "use the estimates that are currently in memory" (meaning, the last `estpost` command that you ran). Then, name your file (if you are not using a working directory, use the complete path) with the extension .tex.

In the options that appear below, wathever is inside the `cell(( ))` parenthesis will beis the statistic that will be shown (note that it has double parenthesis). In this case, we want the mean `mean()`, minimum `min()` and maximum `max()`. We also included the options `nonnumber`, `nomtitle`, and `replace` (see Table 3 below for an explantation of these options).

[Up](#Contents)

### Quick example
http://repec.org/bocode/e/estout/estpost.html#estpost101

### Print the descriptive statistics table in your document

Now, you have successfully saved your .tex file containing your table. Now, you just need to call that .tex file within your .tex document. To do that, you must first create an object with the command begin and tell Latex  that it's a table (see lines belwow). Next line will center the table. Then, by using the command `input`, call your recently created `Table1.tex` file (you don't need to write the file extension, since it is assumed is a .tex file). Next line `caption` is the title of your table. Put your title whitin the braces. The title will be automatically numbered. The final line `end` closes the object.

```latex
\begin{table}
\centering
\input{Table1}
\caption{Summary Statistics}
\end{table}
```

By using those five lines, you table will be inserted in your document and should look like this:

![Summary Statistics](Ancillary/Tables/04_01_Table1.tex)

### Tabular environment formatting within `estout`
- **nonumbers**. In descriptive statistics tables, avoids printing the column number in the table header.

formatted tabular
```stata
esttab . using ".\report\Table1.tex", cell((mean() min() max())) nonumber nomtitle replace
```

[Here the link to the dofile](https://crenteriam.github.io/files/tutorials/tables-descriptives.do)

- File Dingnan here.

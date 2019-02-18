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

### Quick example

### Other
Load the `auto` dataset. Then, produce a descriptive statistics table for the variables mpg, price and weight with the command `estpost`.

```latex
\begin{Verbatim}
sysuse auto
estpost sum mpg price weight
\end{Verbatim}
```

This command produces the descriptive statistics table. Now, we need to export it as a .tex file. To do that, we will use the command `esttab`. In the command chunk below you will notice a dot after `esttab`. As shown in the section [tables ols](TBD), esttab is used by calling an object stored (either with `estimates store` or `eststo`). But in this case, we will use what Stata has in memory after running `estpost sum mpg price weight`. The dot means "use the estimates that are currently in memory" (meaning, the last `estpost` command that you ran). Then, name your file (if you are not using a working directory, use the complete path) with the extension .tex.

In the options that appear below, wathever is inside the `cell(( ))` parenthesis will beis the statistic that will be shown (note that it has double parenthesis). In this case, we want the mean `mean()`, minimum `min()` and maximum `max()`. We also included the options `nonnumber`, `nomtitle`, and `replace` (see Table 3 below for an explantation of these options).

```latex
\begin{Verbatim}
esttab . using ".\report\Table1.tex", ///
       cell((mean() min() max())) nonumber nomtitle replace
\end{Verbatim}
```

Now, you have successfully saved your .tex file containing your table. Now, you just need to call that .tex file within your .tex document. To do that, you must first create an object with the command begin and tell Latex  that it's a table (see lines belwow). Next line will center the table. Then, by using the command `input`, call your recently created `Table1.tex` file (you don't need to write the file extension, since it is assumed is a .tex file). Next line `caption` is the title of your table. Put your title whitin the braces. The title will be automatically numbered. The final line `end` closes the object.

```latex
\begin{Verbatim}
\begin{table}[H]
\centering
	\input{Table1}
\caption{Summary Statistics}
\end{table}
\end{Verbatim}
```

By using those five lines, you table will be inserted in your document and should look like this:

![Summary Statistics](Ancillary/Tables/04_01_Table1.tex)


[Here the link to the dofile]()

- File Dingnan here.

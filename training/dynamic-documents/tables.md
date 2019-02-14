---
title: Tables
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---
| **Dynamic Documents with Stata.** Tools for Integrating Your Research Workflow |

<a name="Contents"></a>
[Teaching](../../../teaching) &rarr; [Dynamic Documents with Stata](dynamicdocs-stata.md)  &rarr; Tables

| Jump to sub-sections: |
| [Descriptive Statistics Tables](../tables-descriptives) |
| [Regression Tables](../tables-ols)   |
| [Personalized Tables](../tables-personalized)  |

### Introduction
1. Creating the Table in stata
2. Storing the table in your workind directory
3. Linking the Table in Latex
4. Basic editing of tables in Latex

### Creating the Table in Stata

[Up](#Contents)

### Storing the Table in the Working Directory

[Up](#Contents)

### Linking the Table to the Latex Documents

The basic syntax to create a table in Latex is:

```latex
\begin{table}[h]
    \centering
    \begin{tabular}{c|c}
        Cell A & Cell B \\
        Cell C & Cell D \\
    \end{tabular}
\end{table}
```

The whole table enviornment is contained between the lines `\begin{table}` and `\end{table}`. The environment ***table*** contains information about the title, a label for hyperreference, the horizonta and positioning, among others.

Note that there is an `[h]` at the right side of `\begin{table}`. This XXXXX.

But the environment ***table*** does not contain the *actual table*, only the *metadata* of the table. The *actual table* is contained within the environment ***tabular*** which is contained between `\begin{tabular}` and `\end{tabular}`. At the right side of `\begin{tabular}`, says `{c|c}`. This is the instruction of the number of columns you want to the table to have. But instead of giving a number, we are providing a letter per each column, The letters mean the positioning of the text within the column; `c` stands for centered, `r` for right, and `l` for left. The pipe `|` means you want to draw a vertical line between columns. If you want no lines between colums, leave a blank space. For example in `{l c c}` I am speficying a table with three columns without vertical lines. In the first column, the text will be left-sided, and centered in the remaning two columns.

The number of rows XXXX.

- graphicsx package
- what is a float in footnote.
- bring this from latex book.
-

[Up](#Contents)

### Elementary Table Editing in Latex


- size, float H, caption, label, tabular vs tabularx
- links to sideways, longtable

[Up](#Contents)

### Easier workflow

-table as separate file, and then use input. show some screens with this. Also helps bc R and Stata will provide table as separate file.

[Up](#Contents)

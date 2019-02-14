---
title: Tables
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---
| [**Dynamic Documents with Stata.**](dynamicdocs-stata.md) Tools for Integrating Your Research Workflow |

<a name="Contents"></a>
<p style="text-align: center;">
 <a href="#">Previous section</a> &larr; Tables &rarr; <a href="#">Next section</a>
</p>

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

The whole table enviornment is contained between the lines `\begin{table}` and `\end{table}`. The ***table*** environment contains information about the title, a label for hyperreference, the horizonta and positioning, among others.

Note that there is an `[h]` at the right side of `\begin{table}`. This XXXXX. Also, at the beginning of the ***table*** environment, the command `\centering` is telling Latex to print the table centered.

But the environment ***table*** does not contain the *actual table*, only the *metadata* of the table. The *actual table* is contained within the environment ***tabular*** which is contained between `\begin{tabular}` and `\end{tabular}`. At the right side of `\begin{tabular}`, says `{c|c}`. This is the instruction of the number of columns you want to the table to have. But instead of giving a number, we are providing a letter per each column, The letters mean the positioning of the text within the column; `c` stands for centered, `r` for right, and `l` for left. The pipe `|` means you want to draw a vertical line between columns. If you want no lines between colums, leave a blank space. For example, in `{l c c}` I am speficying a table with three columns without vertical lines. In the first column, the text will be left-sided, and centered in the remaning two columns.

The rows have a different logics. Between , each programming line is a row. Each row has to end with `\\` which is equivalent to hit enter in your word processor. For example, from the code chunk above `Cell A & Cell B \\` represents the first row of the table. As for that chunk we definded two columns, *Cell A* will be the text contained in the first row and first column. The symbol `&` will tell Latex to move to the next column, within the same row. Therefore, `Cell B` will be the contents of the second column. As we only have two columns, the next step is to end the line with `\\`.

- graphicsx package
- what is a float in footnote.
- bring this from latex book.


[Up](#Contents)

### Elementary Table Editing in Latex

**Caption.**

**Label.**

**Horizontal Lines**

**Vertical Positioning**
- float H

**Multiple Columns**

**Multiple Rows**

**Rotating Text**


### Table Size

There are three common issues related with the table size. Typically, the table width is <u>wider</u> than the text width. Also, the table could be <u>longer</u> than a page. Or you might want to print the table <u>rotated</u>. The environment ***tabular*** completely fails to meet these requirements. Therefore, you will need to use other environments.

**The table is wider than the text width.** Here, main problem with the environment ***tabular*** is that it strictly respects the width of your character string in that cell. That means that if you have a string such as "This is a long string", ***tabular*** will not break down that sentence into multiple lines. [Extended explanation](https://tex.stackexchange.com/questions/10535/how-to-force-a-table-into-page-width).

There are two ways to hack that problem. The first one is to **manually defining the with of the column.** To do so, you must replace the column letter (e.g., `c`) by `p{}` and define the lenght in points (px), centimeters (cm) or inches (in). For example, in the table below, the first column is fixed to 3 centimeters and the second column to 3 inches.

```latex
\begin{table}[h]
    \centering
    \begin{tabular}{p{3cm} p{3in}}
        "This is a long string" & "Text" \\
        "Text" & "Text" \\
    \end{tabular}
\end{table}
```

**The table is longer than the page length.**

**How can I rotate the table to be printed horizontally?**

[Up](#Contents)

### Easier workflow

-table as separate file, and then use input. show some screens with this. Also helps bc R and Stata will provide table as separate file.

[Up](#Contents)
